import 'package:audio_service/audio_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/audio/background_audio_handler.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/autoplay/presentation/controllers/autoplay_queue_controller.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/shared/widgets/playing_bars_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Alto fijo de cada fila: permite saltar directo a la pista actual al abrir la
/// cola sin tener que medir la lista.
const double _rowExtent = 64;
const double _sectionLabelExtent = 34;

/// Cuando falta menos de esto para el fondo de la lista se piden mas pistas,
/// para que el usuario pueda seguir bajando y viendo opciones.
const double _loadMoreMargin = 320;

/// La cola de reproduccion completa: lo que ya sono, lo que suena (resaltado y
/// con el ecualizador en movimiento) y lo que viene.
///
/// Se puede seguir bajando indefinidamente: al acercarse al final pide mas
/// pistas del mix. Eso solo agrega filas a la lista — el prefetch y las
/// descargas siguen mirando la cabeza de la cola, asi que ver opciones que
/// todavia no estan cacheadas no cuesta datos.
class NowPlayingQueueView extends ConsumerStatefulWidget {
  const NowPlayingQueueView({
    super.key,
    required this.onPlay,
    this.onTrackSelected,
    this.currentFallback,
    this.reorderable = true,
    this.padding = EdgeInsets.zero,
  });

  /// Arranca la pista elegida: el llamador es el que sabe como reproducir.
  final Future<void> Function(NextTrack? track) onPlay;

  /// Se llama al elegir una pista, p. ej. para cerrar la hoja modal.
  final VoidCallback? onTrackSelected;

  /// Metadatos de respaldo para la fila actual cuando la cola todavia no tiene
  /// pista corriente (p. ej. una cancion abierta desde favoritos).
  final YouTubeSearchSuggestion? currentFallback;

  final bool reorderable;
  final EdgeInsets padding;

  @override
  ConsumerState<NowPlayingQueueView> createState() =>
      _NowPlayingQueueViewState();
}

class _NowPlayingQueueViewState extends ConsumerState<NowPlayingQueueView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // Abre ya posicionado en la cancion que suena, con el historial arriba.
    _scrollController = ScrollController(initialScrollOffset: _currentOffset());
    _scrollController.addListener(_maybeLoadMore);
    WidgetsBinding.instance.addPostFrameCallback((_) => _snapToCurrent());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_maybeLoadMore);
    _scrollController.dispose();
    super.dispose();
  }

  double _currentOffset() {
    final queue = ref.read(autoplayQueueControllerProvider);
    if (queue.played.isEmpty) return 0;
    return _sectionLabelExtent + queue.played.length * _rowExtent;
  }

  /// El salto inicial es una estimacion; una vez medida la lista se ajusta al
  /// maximo real para no dejarla pasada de largo.
  void _snapToCurrent() {
    if (!mounted || !_scrollController.hasClients) return;
    final position = _scrollController.position;
    final target = _currentOffset().clamp(0.0, position.maxScrollExtent);
    if ((position.pixels - target).abs() > 1) _scrollController.jumpTo(target);
  }

  void _maybeLoadMore() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - _loadMoreMargin) return;

    final queue = ref.read(autoplayQueueControllerProvider);
    if (queue.isLoadingMore || !queue.canLoadMore) return;
    ref.read(autoplayQueueControllerProvider.notifier).loadMoreUpcoming();
  }

  Future<void> _play(NextTrack? track) async {
    if (track == null) return;
    widget.onTrackSelected?.call();
    await widget.onPlay(track);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final queue = ref.watch(autoplayQueueControllerProvider);
    final notifier = ref.read(autoplayQueueControllerProvider.notifier);
    final current = queue.current ?? widget.currentFallback;
    final upcoming = queue.upcoming;

    if (current == null && upcoming.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            queue.isLoadingMore
                ? LocaleKeys.loading.tr()
                : LocaleKeys.empty_queue.tr(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
    }

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverPadding(padding: EdgeInsets.only(top: widget.padding.top)),
        if (queue.played.isNotEmpty) ...[
          _sectionLabel(theme, LocaleKeys.previously_played.tr()),
          SliverFixedExtentList(
            itemExtent: _rowExtent,
            delegate: SliverChildBuilderDelegate(
              childCount: queue.played.length,
              (context, index) => _QueueRowTile(
                track: queue.played[index],
                position: index + 1,
                dimmed: true,
                horizontalPadding: widget.padding.left,
                onTap: () => _play(notifier.playPlayedAt(index)),
              ),
            ),
          ),
        ],
        if (current != null)
          SliverToBoxAdapter(
            child: StreamBuilder<PlaybackState>(
              stream: flowAudioHandler.playbackState,
              builder: (context, snapshot) => SizedBox(
                height: _rowExtent,
                child: _QueueRowTile(
                  track: current,
                  position: queue.currentPosition,
                  total: queue.totalTracks,
                  isCurrent: true,
                  isPlaying: snapshot.data?.playing ?? false,
                  horizontalPadding: widget.padding.left,
                ),
              ),
            ),
          ),
        if (upcoming.isNotEmpty) _sectionLabel(theme, LocaleKeys.up_next.tr()),
        if (widget.reorderable)
          SliverReorderableList(
            itemCount: upcoming.length,
            itemExtent: _rowExtent,
            onReorderItem: notifier.moveUpcoming,
            itemBuilder: (context, index) =>
                ReorderableDelayedDragStartListener(
                  key: ValueKey('queue-upcoming-${upcoming[index].videoId}'),
                  index: index,
                  child: _upcomingRow(queue, notifier, index),
                ),
          )
        else
          SliverFixedExtentList(
            itemExtent: _rowExtent,
            delegate: SliverChildBuilderDelegate(
              childCount: upcoming.length,
              (context, index) => _upcomingRow(queue, notifier, index),
            ),
          ),
        SliverToBoxAdapter(
          child: _Footer(
            isLoadingMore: queue.isLoadingMore,
            canLoadMore: queue.canLoadMore,
            bottomPadding: widget.padding.bottom,
          ),
        ),
      ],
    );
  }

  Widget _upcomingRow(
    AutoplayQueueState queue,
    AutoplayQueueController notifier,
    int index,
  ) {
    final track = queue.upcoming[index];
    return _QueueRowTile(
      track: track,
      position: queue.currentPosition + index + 1,
      horizontalPadding: widget.padding.left,
      onTap: () => _play(notifier.playUpcomingAt(index)),
      onRemove: () => notifier.removeUpcomingAt(index),
    );
  }

  Widget _sectionLabel(ThemeData theme, String text) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: _sectionLabelExtent,
        child: Padding(
          padding: EdgeInsets.fromLTRB(widget.padding.left + 10, 10, 12, 4),
          child: Text(
            text.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              letterSpacing: 1.2,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

/// Fila de la cola: numero de posicion (o el ecualizador, si es la que suena),
/// caratula y titulo/artista.
class _QueueRowTile extends StatelessWidget {
  const _QueueRowTile({
    required this.track,
    required this.position,
    this.total,
    this.isCurrent = false,
    this.isPlaying = false,
    this.dimmed = false,
    this.horizontalPadding = 0,
    this.onTap,
    this.onRemove,
  });

  final YouTubeSearchSuggestion track;
  final int position;

  /// Solo en la fila actual: total de pistas conocidas, para el "5 / 24".
  final int? total;

  final bool isCurrent;
  final bool isPlaying;
  final bool dimmed;
  final double horizontalPadding;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(horizontalPadding + 4, 3, 4, 3),
      child: Material(
        color: isCurrent
            ? colors.primary.withValues(alpha: 0.14)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                  child: isCurrent
                      ? Center(
                          child: PlayingBarsIndicator(
                            isPlaying: isPlaying,
                            size: 16,
                          ),
                        )
                      : Text(
                          '$position',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colors.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
                const SizedBox(width: 8),
                _Thumbnail(url: track.thumbnailUrl, dimmed: dimmed),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        track.displayText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: isCurrent
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: dimmed
                              ? colors.onSurfaceVariant
                              : isCurrent
                              ? colors.primary
                              : colors.onSurface,
                        ),
                      ),
                      if (track.channelTitle.isNotEmpty)
                        Text(
                          track.channelTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
                if (total != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '$position / $total',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                if (onRemove != null)
                  IconButton(
                    tooltip: LocaleKeys.delete.tr(),
                    onPressed: onRemove,
                    iconSize: 18,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: const BoxConstraints.tightFor(
                      width: 34,
                      height: 34,
                    ),
                    icon: Icon(
                      Icons.close_rounded,
                      color: colors.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.url, required this.dimmed});

  final String url;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    const size = 42.0;
    final fallback = DecoratedBox(
      decoration: BoxDecoration(color: colors.surfaceContainerHigh),
      child: Icon(
        Icons.music_note_rounded,
        size: 20,
        color: colors.onSurfaceVariant,
      ),
    );

    return Opacity(
      opacity: dimmed ? 0.6 : 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: SizedBox.square(
          dimension: size,
          child: url.isEmpty
              ? fallback
              : Image.network(
                  url,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => fallback,
                ),
        ),
      ),
    );
  }
}

/// Pie de la cola: avisa que se estan trayendo mas pistas mientras el usuario
/// sigue bajando.
class _Footer extends StatelessWidget {
  const _Footer({
    required this.isLoadingMore,
    required this.canLoadMore,
    required this.bottomPadding,
  });

  final bool isLoadingMore;
  final bool canLoadMore;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (!isLoadingMore) {
      return SizedBox(height: canLoadMore ? 28 + bottomPadding : bottomPadding);
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 14, 20, 14 + bottomPadding),
      child: Row(
        children: [
          const SizedBox.square(
            dimension: 16,
            child: CircularProgressIndicator.adaptive(strokeWidth: 2),
          ),
          const SizedBox(width: 12),
          Text(
            LocaleKeys.loading.tr(),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

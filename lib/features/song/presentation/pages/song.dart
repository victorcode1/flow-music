import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/adaptive_layout.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/audio_tools/presentation/controllers/audio_tools_controller.dart';
import 'package:flow_music/features/autoplay/presentation/controllers/autoplay_queue_controller.dart';
import 'package:flow_music/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:flow_music/features/home/presentation/controllers/home_app_bar_action_controller.dart';
import 'package:flow_music/features/settings/presentation/controllers/default_playback_mode_controller.dart';
import 'package:flow_music/features/song/presentation/controllers/repeat_mode_controller.dart';
import 'package:flow_music/features/song/presentation/controllers/song_controller.dart';
import 'package:flow_music/features/song/presentation/controllers/song_page_controller.dart';
import 'package:flow_music/features/song/presentation/widgets/modern_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SongWidget extends ConsumerStatefulWidget {
  final Map<String?, String?> data;

  /// Cuando es `true`, el reproductor se abrio fuera del shell `HomePage`
  /// (p.ej. empujado con `Navigator.push` desde la biblioteca o una playlist),
  /// por lo que no hay `AppAbarMain` arriba. En ese caso `ScreenPlay` dibuja su
  /// propio boton de retroceso y el titulo en el app bar para no quedar sin
  /// cabecera ni navegacion.
  final bool standalone;
  const SongWidget({super.key, required this.data, this.standalone = false});

  static const SongPageController pageController = SongPageController();

  @override
  ConsumerState<SongWidget> createState() => _PlaySongState();
}

class _PlaySongState extends ConsumerState<SongWidget> {
  @override
  void initState() {
    debugPrint('Initializing SongWidget with data: ${widget.data}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final playListId = widget.data['playListId'];
    final controller = ref.watch(songController);
    SongWidget.pageController.configurePlaylist(
      controller: controller,
      playlistId: playListId,
    );
    final args = SongWidget.pageController.resolveArgs(
      data: widget.data,
      controller: controller,
    );

    if (args == null) {
      return Center(child: Text(LocaleKeys.no_id_song.tr()));
    }

    return ScreenPlay(
      id: args.id,
      initialMode: args.initialMode,
      initialDuration: args.initialDuration,
      standalone: widget.standalone,
    );
  }
}

class ScreenPlay extends ConsumerStatefulWidget {
  final String id;
  final PlaybackMode? initialMode;
  final Duration? initialDuration;
  final bool standalone;
  const ScreenPlay({
    super.key,
    required this.id,
    this.initialMode,
    this.initialDuration,
    this.standalone = false,
  });

  @override
  ConsumerState<ScreenPlay> createState() => _ScreenPlayState();
}

class _ScreenPlayState extends ConsumerState<ScreenPlay>
    with AutomaticKeepAliveClientMixin<ScreenPlay> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SongWidget.pageController.initializePlayback(
        controller: ref.read(songController),
        id: widget.id,
        initialMode: widget.initialMode,
        defaultMode: ref.read(defaultPlaybackModeControllerProvider),
        initialDuration: widget.initialDuration,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = ref.watch(songController);
    final autoplayQueue = ref.watch(autoplayQueueControllerProvider);
    final autoplayNotifier = ref.read(autoplayQueueControllerProvider.notifier);
    final repeatEnabled = ref.watch(repeatModeControllerProvider);
    final repeatNotifier = ref.read(repeatModeControllerProvider.notifier);
    final audioTools = ref.watch(audioToolsControllerProvider);
    final audioToolsNotifier = ref.read(audioToolsControllerProvider.notifier);
    final currentVideoId = controller.currentVideoId ?? widget.id;
    final favorites = ref.watch(favoritesControllerProvider);
    final isFavorite = favorites.any(
      (favorite) => favorite.videoId == currentVideoId,
    );

    final theme = Theme.of(context);
    final isWide = supportsFlowDesktopShell && useFlowWideLayout(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      // Igual al mockup: el reproductor inmersivo no lleva toggle Audio/Video
      // arriba (el chip "Video" del pie cubre el cambio de modo). En el shell la
      // cabecera "REPRODUCIENDO" ya viene del app bar de home; solo en modo
      // standalone dibujamos un app bar propio con el boton de retroceso.
      appBar: widget.standalone
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: theme.colorScheme.onSurface,
                ),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: ModernPlayerWidget(
              audioPlayer: controller.audioPlayer,
              videoController: controller.videoPlayerController,
              webEmbedVideoId: controller.webEmbedVideoId,
              currentVideoId: currentVideoId,
              videoTitle: controller.displayTitle,
              videoAuthor: controller.displayAuthor,
              thumbnailUrl: controller.displayThumbnailUrl,
              isLoading: controller.isLoading,
              isFavorite: isFavorite,
              onToggleFavorite: currentVideoId.isEmpty
                  ? null
                  : () => _toggleFavorite(
                      context: context,
                      videoId: currentVideoId,
                      title: controller.displayTitle ?? currentVideoId,
                      author: controller.displayAuthor ?? '',
                      thumbnailUrl: controller.displayThumbnailUrl ?? '',
                    ),
              onPrevious: autoplayQueue.hasPrevious
                  ? () => SongWidget.pageController.playFromQueue(
                      controller: controller,
                      track: autoplayNotifier.playPrevious(),
                    )
                  : null,
              onNext: autoplayQueue.hasNext
                  ? () => SongWidget.pageController.playFromQueue(
                      controller: controller,
                      track: autoplayNotifier.playNext(),
                    )
                  : null,
              repeatEnabled: repeatEnabled,
              onToggleRepeat: repeatNotifier.toggle,
              onShuffle: autoplayQueue.hasNext
                  ? autoplayNotifier.shuffleUpcoming
                  : null,
              playbackRate: audioTools.playbackRate,
              normalizeVolume: audioTools.normalizeVolume,
              smoothTransitions: audioTools.smoothTransitions,
              onPlaybackRateChanged: audioToolsNotifier.setPlaybackRate,
              onNormalizeVolumeChanged: audioToolsNotifier.setNormalizeVolume,
              onSmoothTransitionsChanged:
                  audioToolsNotifier.setSmoothTransitions,
              // En escritorio el reproductor inmersivo muestra la cola a la
              // derecha.
              sourceLabel: isWide ? LocaleKeys.playing.tr() : null,
              sideRail: isWide ? const _PlayerQueueRail() : null,
            ),
          ),
          // En movil, accesos rapidos al pie (Video / Cola). En escritorio el
          // riel lateral cubre la cola, asi que se ocultan.
          if (!isWide)
            _PlayerActionChips(
              isVideo: controller.currentMode == PlaybackMode.video,
              onToggleVideo: () => controller.switchMode(
                controller.currentMode == PlaybackMode.video
                    ? PlaybackMode.audio
                    : PlaybackMode.video,
              ),
              onQueue: () =>
                  showNowPlayingQueueSheet(context: context, ref: ref),
            ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _toggleFavorite({
    required BuildContext context,
    required String videoId,
    required String title,
    required String author,
    required String thumbnailUrl,
  }) async {
    if (videoId.isEmpty) return;
    final added = await ref
        .read(favoritesControllerProvider.notifier)
        .toggle(
          videoId: videoId,
          title: title,
          author: author,
          thumbnailUrl: thumbnailUrl,
        );
    if (!context.mounted) return;
    final messenger = ScaffoldMessenger.maybeOf(context);
    messenger?.hideCurrentSnackBar();
    messenger?.showSnackBar(
      SnackBar(
        content: Text(
          added
              ? LocaleKeys.added_to_favorites.tr()
              : LocaleKeys.removed_from_favorites.tr(),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

/// Fila de accesos rapidos al pie del reproductor: Video / Cola.
class _PlayerActionChips extends StatelessWidget {
  const _PlayerActionChips({
    required this.isVideo,
    required this.onToggleVideo,
    required this.onQueue,
  });

  final bool isVideo;
  final VoidCallback onToggleVideo;
  final VoidCallback onQueue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _PlayerActionChip(
              icon: isVideo ? Icons.videocam_rounded : Icons.videocam_outlined,
              label: LocaleKeys.video.tr(),
              selected: isVideo,
              onTap: onToggleVideo,
            ),
            _PlayerActionChip(
              icon: Icons.queue_music_rounded,
              label: LocaleKeys.queue.tr(),
              onTap: onQueue,
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayerActionChip extends StatelessWidget {
  const _PlayerActionChip({
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final foreground = selected ? colors.primary : colors.onSurfaceVariant;

    return Material(
      color: selected
          ? colors.primary.withValues(alpha: 0.14)
          : colors.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: foreground),
              const SizedBox(width: 8),
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(color: foreground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Riel derecho del reproductor en escritorio con la cola de reproducción.
class _PlayerQueueRail extends ConsumerWidget {
  const _PlayerQueueRail();

  void _playUpcoming(WidgetRef ref, int index) {
    final notifier = ref.read(autoplayQueueControllerProvider.notifier);
    SongWidget.pageController.playFromQueue(
      controller: ref.read(songController),
      track: notifier.playUpcomingAt(index),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final queue = ref.watch(autoplayQueueControllerProvider);
    final controller = ref.watch(songController);

    final current = queue.current;
    final curTitle = current?.displayText ?? controller.displayTitle ?? '';
    final curSubtitle = current?.channelTitle ?? controller.displayAuthor ?? '';
    final curThumb =
        current?.thumbnailUrl ?? controller.displayThumbnailUrl ?? '';

    return SafeArea(
      left: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
            child: Text(
              LocaleKeys.queue.tr(),
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.onSurface,
              ),
            ),
          ),
          Divider(height: 1, color: colors.outlineVariant),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 18),
              children: [
                if (curTitle.isNotEmpty)
                  _QueueRow(
                    title: curTitle,
                    subtitle: curSubtitle,
                    thumbnailUrl: curThumb,
                    isCurrent: true,
                    onTap: null,
                  ),
                for (var i = 0; i < queue.upcoming.length; i++)
                  _QueueRow(
                    title: queue.upcoming[i].displayText,
                    subtitle: queue.upcoming[i].channelTitle,
                    thumbnailUrl: queue.upcoming[i].thumbnailUrl,
                    isCurrent: false,
                    onTap: () => _playUpcoming(ref, i),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Fila de la cola: carátula + título/artista. La pista actual va resaltada.
class _QueueRow extends StatelessWidget {
  const _QueueRow({
    required this.title,
    required this.subtitle,
    required this.thumbnailUrl,
    required this.isCurrent,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final bool isCurrent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Material(
      color: isCurrent
          ? colors.primary.withValues(alpha: 0.12)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: SizedBox.square(
                  dimension: 44,
                  child: thumbnailUrl.isEmpty
                      ? DecoratedBox(
                          decoration: BoxDecoration(
                            color: colors.surfaceContainerHigh,
                          ),
                          child: Icon(
                            Icons.music_note_rounded,
                            size: 20,
                            color: colors.primary,
                          ),
                        )
                      : Image.network(
                          thumbnailUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => DecoratedBox(
                            decoration: BoxDecoration(
                              color: colors.surfaceContainerHigh,
                            ),
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isCurrent ? colors.primary : colors.onSurface,
                      ),
                    ),
                    if (subtitle.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

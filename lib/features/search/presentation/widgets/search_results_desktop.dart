import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/theme/desktop_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flutter/material.dart';

/// Resultados de busqueda en escritorio.
///
/// El mockup "Escritorio · Inicio / Búsqueda" reparte la pantalla en dos: el
/// resultado principal como tarjeta grande a la izquierda y el resto como lista
/// densa a la derecha. Antes esto era una sola columna de tarjetas de 28px de
/// radio estiradas a todo el ancho — el "vacío negro" que el rediseno ataca.
///
/// El mockup tambien lleva chips de filtro (Artistas / Álbumes / Playlists) y
/// un riel de artistas relacionados. No estan aqui: la busqueda de la app
/// devuelve videos de YouTube, no entidades de artista o album, asi que esos
/// controles no tendrian nada que filtrar ni que mostrar.
class SearchResultsDesktop extends StatelessWidget {
  const SearchResultsDesktop({
    super.key,
    required this.items,
    required this.onPlay,
  });

  /// Ancho de la columna del resultado principal, como en el mockup.
  static const double _topResultWidth = 380;

  /// Ancho minimo de la columna de canciones para que la fila no se desborde.
  static const double _songsMinWidth = 260;

  /// Margen lateral del area de resultados (los 36px del mockup, a cada lado).
  static const double _horizontalInset = 36;

  final List<YouTubeSearchSuggestion> items;
  final void Function(int index) onPlay;

  @override
  Widget build(BuildContext context) {
    final rest = items.length > 1
        ? items.sublist(1)
        : const <YouTubeSearchSuggestion>[];

    final topResult = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SectionTitle(LocaleKeys.top_result.tr()),
        const SizedBox(height: 14),
        _TopResultCard(suggestion: items.first, onPlay: () => onPlay(0)),
      ],
    );

    final songs = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SectionTitle(LocaleKeys.songs.tr()),
        const SizedBox(height: 14),
        for (var index = 0; index < rest.length; index++)
          _SongRow(
            suggestion: rest[index],
            // `rest` arranca en el segundo elemento de `items`.
            onTap: () => onPlay(index + 1),
          ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        // El shell de escritorio ya no cede el sitio al diseno movil cuando la
        // ventana se encoge, asi que la rejilla se adapta: si las dos columnas
        // del mockup no caben (380 + canciones), el resultado principal pasa
        // encima de la lista en vez de desbordar la fila.
        final available = constraints.maxWidth - _horizontalInset * 2;
        final twoColumns = available >= _topResultWidth + 24 + _songsMinWidth;

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            _horizontalInset,
            30,
            _horizontalInset,
            44,
          ),
          child: twoColumns
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: _topResultWidth, child: topResult),
                    const SizedBox(width: 24),
                    Expanded(child: songs),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [topResult, const SizedBox(height: 26), songs],
                ),
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.titleLarge?.copyWith(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}

/// Tarjeta grande del primer resultado.
class _TopResultCard extends StatelessWidget {
  const _TopResultCard({required this.suggestion, required this.onPlay});

  final YouTubeSearchSuggestion suggestion;
  final VoidCallback onPlay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Material(
      color: colors.surfaceContainer,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPlay,
        child: Stack(
          children: [
            // Resplandor del acento en la esquina, como en el mockup.
            Positioned(
              top: -40,
              right: -30,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      colors.primary.withValues(alpha: 0.4),
                      colors.primary.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Artwork(
                    url: suggestion.thumbnailUrl,
                    size: 110,
                    radius: 18,
                    colors: colors,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    suggestion.displayText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.6,
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (suggestion.channelTitle.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: colors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(
                          FlowDesktopTheme.pillRadius,
                        ),
                      ),
                      child: Text(
                        suggestion.channelTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  const SizedBox(height: 18),
                  Material(
                    color: colors.primary,
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: onPlay,
                      child: SizedBox.square(
                        dimension: 54,
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 26,
                          color: colors.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Fila compacta de la lista de canciones.
class _SongRow extends StatelessWidget {
  const _SongRow({required this.suggestion, required this.onTap});

  final YouTubeSearchSuggestion suggestion;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final duration = suggestion.duration;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          child: Row(
            children: [
              _Artwork(
                url: suggestion.thumbnailUrl,
                size: 44,
                radius: 8,
                colors: colors,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      suggestion.displayText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: colors.onSurface,
                      ),
                    ),
                    if (suggestion.channelTitle.isNotEmpty)
                      Text(
                        suggestion.channelTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
              if (duration != null) ...[
                const SizedBox(width: 14),
                Text(
                  _format(duration),
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: FlowDesktopTheme.faint(colors),
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  static String _format(Duration value) {
    final hours = value.inHours;
    final minutes = value.inMinutes.remainder(60);
    final seconds = value.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:$seconds';
    }
    return '$minutes:$seconds';
  }
}

class _Artwork extends StatelessWidget {
  const _Artwork({
    required this.url,
    required this.size,
    required this.radius,
    required this.colors,
  });

  final String url;
  final double size;
  final double radius;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final fallback = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Icon(
        Icons.music_note_rounded,
        size: size * 0.45,
        color: colors.primary,
      ),
    );
    if (url.isEmpty) return fallback;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        url,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => fallback,
      ),
    );
  }
}

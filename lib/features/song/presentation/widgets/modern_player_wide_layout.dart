import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'modern_player_artwork.dart';
import 'youtube_embed_view_stub.dart'
    if (dart.library.js_interop) 'youtube_embed_view_web.dart';

class ModernPlayerWideLayout extends StatelessWidget {
  final ThemeData theme;
  final bool isDark;
  final Gradient? backgroundGradient;
  final Color? backgroundColor;
  final bool isLoading;
  final String? webEmbedVideoId;
  final String? videoTitle;
  final String? videoAuthor;
  final String? thumbnailUrl;
  final VideoPlayerController? videoController;
  final Widget controls;

  /// Riel derecho del reproductor (cola "A continuación" / "Letra"), como en
  /// el mockup StreamBeat. Null en pantallas sin cola.
  final Widget? sideRail;

  /// Etiqueta de origen ("Reproduciendo desde…") mostrada sobre la carátula.
  final String? sourceLabel;

  const ModernPlayerWideLayout({
    super.key,
    required this.theme,
    required this.isDark,
    this.backgroundGradient,
    this.backgroundColor,
    required this.isLoading,
    this.webEmbedVideoId,
    this.videoTitle,
    this.videoAuthor,
    this.thumbnailUrl,
    this.videoController,
    required this.controls,
    this.sideRail,
    this.sourceLabel,
  });

  @override
  Widget build(BuildContext context) {
    final colors = theme.colorScheme;
    // Fondo inmersivo del mockup StreamBeat: base oscura con un resplandor
    // radial del color de marca arriba y otro tenue abajo.
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: backgroundGradient,
        color: backgroundColor ?? colors.surface,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -1.1),
                  radius: 1.1,
                  colors: [
                    colors.primary.withValues(alpha: isDark ? 0.26 : 0.12),
                    colors.primary.withValues(alpha: isDark ? 0.08 : 0.04),
                    Colors.transparent,
                  ],
                  stops: const [0, 0.4, 1],
                ),
              ),
            ),
          ),
          if (isLoading)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: colors.primary,
                    strokeWidth: 3,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    LocaleKeys.loading.tr(),
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _buildNowPlaying(context)),
                if (sideRail != null && webEmbedVideoId == null)
                  Container(
                    width: 320,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: colors.outlineVariant),
                      ),
                      color: colors.surfaceContainerLowest.withValues(
                        alpha: isDark ? 0.4 : 1,
                      ),
                    ),
                    child: sideRail,
                  ),
              ],
            ),
        ],
      ),
    );
  }

  /// Columna central del reproductor inmersivo: origen, carátula, y los
  /// controles (título + onda de progreso + transporte).
  Widget _buildNowPlaying(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(40, 28, 40, 32),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if ((sourceLabel ?? '').isNotEmpty) ...[
                Text(
                  sourceLabel!.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    letterSpacing: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
              ],
              SizedBox(
                width: 300,
                height: 300,
                child: webEmbedVideoId == null
                    ? ModernPlayerArtwork(
                        theme: theme,
                        videoController: videoController,
                        thumbnailUrl: thumbnailUrl,
                        borderRadius: 18,
                      )
                    : _buildWebEmbed(webEmbedVideoId!),
              ),
              const SizedBox(height: 28),
              if (webEmbedVideoId != null) _buildWebEmbedStatus() else controls,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWebEmbed(String videoId) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.22),
              blurRadius: 42,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: YoutubeEmbedView(videoId: videoId),
      ),
    );
  }

  Widget _buildWebEmbedStatus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.play_circle_rounded, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          Text(
            videoTitle == null ? LocaleKeys.playing.tr() : 'YouTube',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

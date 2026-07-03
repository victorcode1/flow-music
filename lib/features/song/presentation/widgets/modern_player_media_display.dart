import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'fullscreen_video_player.dart';
import 'modern_player_artwork.dart';
import 'youtube_embed_view_stub.dart'
    if (dart.library.js_interop) 'youtube_embed_view_web.dart';

class ModernPlayerMediaDisplay extends StatelessWidget {
  final ThemeData theme;
  final String? webEmbedVideoId;
  final VideoPlayerController? videoController;
  final String? thumbnailUrl;

  const ModernPlayerMediaDisplay({
    super.key,
    required this.theme,
    this.webEmbedVideoId,
    this.videoController,
    this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb && webEmbedVideoId != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: _buildWebEmbed(webEmbedVideoId!),
        ),
      );
    }

    if (videoController != null && videoController!.value.isInitialized) {
      return Center(
        child: FullscreenVideoSurface(controller: videoController!),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = MediaQuery.of(context).size;
        final artworkCap = (screenSize.width * 0.9).clamp(220.0, 520.0);

        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: AspectRatio(
              aspectRatio: 1,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: artworkCap,
                  maxHeight: artworkCap,
                ),
                child: ModernPlayerArtwork(
                  theme: theme,
                  thumbnailUrl: thumbnailUrl,
                  borderRadius: 24,
                ),
              ),
            ),
          ),
        );
      },
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
}

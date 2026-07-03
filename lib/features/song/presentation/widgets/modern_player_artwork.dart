import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'fullscreen_video_player.dart';

class ModernPlayerArtwork extends StatelessWidget {
  final ThemeData theme;
  final VideoPlayerController? videoController;
  final String? thumbnailUrl;
  final double borderRadius;
  final double? maxWidth;
  final double? maxHeight;
  final bool elevated;

  const ModernPlayerArtwork({
    super.key,
    required this.theme,
    this.videoController,
    this.thumbnailUrl,
    this.borderRadius = 24,
    this.maxWidth,
    this.maxHeight,
    this.elevated = true,
  });

  @override
  Widget build(BuildContext context) {
    if (videoController != null && videoController!.value.isInitialized) {
      return FullscreenVideoSurface(
        controller: videoController!,
        borderRadius: borderRadius,
      );
    }

    final content = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: thumbnailUrl != null && thumbnailUrl!.isNotEmpty
          ? Image.network(
              thumbnailUrl!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildDefaultArtwork(theme);
              },
            )
          : _buildDefaultArtwork(theme),
    );

    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
        maxHeight: maxHeight ?? double.infinity,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: elevated
            ? [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.24),
                  blurRadius: 42,
                  offset: const Offset(0, 20),
                ),
              ]
            : null,
      ),
      child: content,
    );
  }

  Widget _buildDefaultArtwork(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.music_note_rounded,
          size: 120,
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}

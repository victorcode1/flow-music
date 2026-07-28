import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/core/utils/adaptive_layout.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../controllers/modern_player_view_controller.dart';
import '../controllers/modern_player_view_state.dart';
import 'modern_player_controls.dart';
import 'modern_player_media_display.dart';
import 'modern_player_wide_layout.dart';

/// Vista del reproductor moderno.
///
/// Solo compone layout y delega estado y comandos al controller de presentacion.
class ModernPlayerWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final VideoPlayerController? videoController;
  final String? webEmbedVideoId;
  final String? currentVideoId;
  final String? videoTitle;
  final String? videoAuthor;
  final String? thumbnailUrl;
  final bool isLoading;
  final bool isDownloading;
  final bool isSavingOffline;
  final bool isAudioDownloaded;
  final bool isOfflineSaved;
  final double downloadProgress;
  final double offlineProgress;
  final String? downloadLabel;
  final Future<void> Function()? onDownloadPressed;
  final Future<void> Function()? onDownloadedFilePressed;
  final Future<void> Function()? onSaveOfflinePressed;
  final Future<void> Function()? onRemoveOfflinePressed;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final bool repeatEnabled;
  final VoidCallback? onToggleRepeat;
  final VoidCallback? onShuffle;
  final double playbackRate;
  final bool normalizeVolume;
  final ValueChanged<double>? onPlaybackRateChanged;
  final ValueChanged<bool>? onNormalizeVolumeChanged;
  final bool isFavorite;
  final VoidCallback? onToggleFavorite;

  /// Riel derecho (cola/letra) que se muestra solo en la variante de escritorio.
  final Widget? sideRail;

  /// Etiqueta de origen ("Reproduciendo desde…") para el escritorio.
  final String? sourceLabel;

  const ModernPlayerWidget({
    super.key,
    required this.audioPlayer,
    this.videoController,
    this.webEmbedVideoId,
    this.currentVideoId,
    this.videoTitle,
    this.videoAuthor,
    this.thumbnailUrl,
    this.isLoading = false,
    this.isDownloading = false,
    this.isSavingOffline = false,
    this.isAudioDownloaded = false,
    this.isOfflineSaved = false,
    this.downloadProgress = 0,
    this.offlineProgress = 0,
    this.downloadLabel,
    this.onDownloadPressed,
    this.onDownloadedFilePressed,
    this.onSaveOfflinePressed,
    this.onRemoveOfflinePressed,
    this.onPrevious,
    this.onNext,
    this.repeatEnabled = false,
    this.onToggleRepeat,
    this.onShuffle,
    this.playbackRate = 1,
    this.normalizeVolume = false,
    this.onPlaybackRateChanged,
    this.onNormalizeVolumeChanged,
    this.isFavorite = false,
    this.onToggleFavorite,
    this.sideRail,
    this.sourceLabel,
  });

  @override
  State<ModernPlayerWidget> createState() => _ModernPlayerWidgetState();
}

class _ModernPlayerWidgetState extends State<ModernPlayerWidget> {
  late final ModernPlayerViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ModernPlayerViewController(
      audioPlayer: widget.audioPlayer,
      videoController: widget.videoController,
      currentVideoId: widget.currentVideoId,
      playbackRate: widget.playbackRate,
      normalizeVolume: widget.normalizeVolume,
    );
  }

  @override
  void didUpdateWidget(covariant ModernPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.syncWith(
      videoController: widget.videoController,
      currentVideoId: widget.currentVideoId,
      playbackRate: widget.playbackRate,
      normalizeVolume: widget.normalizeVolume,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final extras = theme.extension<FlowThemeExtras>();
    final usesWebEmbed = kIsWeb && widget.webEmbedVideoId != null;

    return ValueListenableBuilder<ModernPlayerViewState>(
      valueListenable: _controller,
      builder: (context, playerState, _) {
        final controls = ModernPlayerControls(
          theme: theme,
          isDark: isDark,
          title: widget.videoTitle,
          author: widget.videoAuthor,
          isFavorite: widget.isFavorite,
          onToggleFavorite: widget.onToggleFavorite,
          effectiveDuration: playerState.effectiveDuration,
          position: playerState.position,
          isPlaying: playerState.isPlaying,
          isMuted: playerState.isMuted,
          volume: playerState.volume,
          onTogglePlayPause: _controller.togglePlayPause,
          onSeek: _controller.seekTo,
          onSkipBackward: () => _controller.skip(-10),
          onSkipForward: () => _controller.skip(10),
          onToggleMute: _controller.toggleMute,
          onVolumeChanged: _controller.setVolume,
          onPrevious: widget.onPrevious,
          onNext: widget.onNext,
          repeatEnabled: widget.repeatEnabled,
          onToggleRepeat: widget.onToggleRepeat,
          onShuffle: widget.onShuffle,
        );

        if (supportsFlowDesktopShell && useFlowWideLayout(context)) {
          return ModernPlayerWideLayout(
            theme: theme,
            isDark: isDark,
            backgroundGradient: extras?.secondaryGradient,
            backgroundColor: extras == null ? theme.colorScheme.surface : null,
            isLoading: widget.isLoading,
            webEmbedVideoId: widget.webEmbedVideoId,
            videoTitle: widget.videoTitle,
            videoAuthor: widget.videoAuthor,
            thumbnailUrl: widget.thumbnailUrl,
            videoController: widget.videoController,
            controls: controls,
            sideRail: widget.sideRail,
            sourceLabel: widget.sourceLabel,
          );
        }

        return Container(
          decoration: BoxDecoration(
            gradient: extras?.secondaryGradient,
            color: extras == null ? theme.colorScheme.surface : null,
          ),
          child: widget.isLoading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: theme.colorScheme.primary,
                        strokeWidth: 3,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        LocaleKeys.loading.tr(),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ModernPlayerMediaDisplay(
                        theme: theme,
                        webEmbedVideoId: widget.webEmbedVideoId,
                        videoController: widget.videoController,
                        thumbnailUrl: widget.thumbnailUrl,
                      ),
                    ),
                    if (!usesWebEmbed) controls,
                  ],
                ),
        );
      },
    );
  }
}

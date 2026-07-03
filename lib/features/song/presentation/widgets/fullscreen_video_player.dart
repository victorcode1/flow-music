import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class FullscreenVideoSurface extends StatelessWidget {
  const FullscreenVideoSurface({
    super.key,
    required this.controller,
    this.borderRadius = 0,
  });

  final VideoPlayerController controller;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: _FullscreenIconButton(
              tooltip: LocaleKeys.fullscreen.tr(),
              icon: Icons.fullscreen_rounded,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  fullscreenDialog: true,
                  builder: (_) => _FullscreenVideoPage(controller: controller),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FullscreenVideoPage extends StatefulWidget {
  const _FullscreenVideoPage({required this.controller});

  final VideoPlayerController controller;

  @override
  State<_FullscreenVideoPage> createState() => _FullscreenVideoPageState();
}

class _FullscreenVideoPageState extends State<_FullscreenVideoPage> {
  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      unawaited(
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky),
      );
    }
  }

  @override
  void dispose() {
    if (!kIsWeb) {
      unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder<VideoPlayerValue>(
        valueListenable: controller,
        builder: (context, value, _) {
          return Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.paddingOf(context).top + 12,
                right: 16,
                child: _FullscreenIconButton(
                  tooltip: LocaleKeys.exit_fullscreen.tr(),
                  icon: Icons.fullscreen_exit_rounded,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _FullscreenControls(
                  value: value,
                  onPlayPause: () {
                    if (value.isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                  },
                  onSeek: controller.seekTo,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _FullscreenControls extends StatelessWidget {
  const _FullscreenControls({
    required this.value,
    required this.onPlayPause,
    required this.onSeek,
  });

  final VideoPlayerValue value;
  final VoidCallback onPlayPause;
  final ValueChanged<Duration> onSeek;

  @override
  Widget build(BuildContext context) {
    final duration = value.duration;
    final maxMs = duration.inMilliseconds > 0
        ? duration.inMilliseconds.toDouble()
        : 1.0;
    final positionMs = value.position.inMilliseconds.toDouble().clamp(
      0.0,
      maxMs,
    );

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Color(0xCC000000)],
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 34, 18, 14),
          child: Row(
            children: [
              IconButton(
                tooltip: value.isPlaying
                    ? LocaleKeys.pause.tr()
                    : LocaleKeys.play.tr(),
                icon: Icon(
                  value.isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                ),
                iconSize: 34,
                color: Colors.white,
                onPressed: onPlayPause,
              ),
              Text(
                _formatDuration(value.position),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Slider(
                  value: positionMs,
                  min: 0,
                  max: maxMs,
                  onChanged: duration.inMilliseconds <= 0
                      ? null
                      : (next) => onSeek(Duration(milliseconds: next.round())),
                  activeColor: Colors.white,
                  inactiveColor: Colors.white.withValues(alpha: 0.32),
                ),
              ),
              Text(
                _formatDuration(duration),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    if (hours > 0) {
      return '$hours:${twoDigits(minutes)}:${twoDigits(seconds)}';
    }
    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }
}

class _FullscreenIconButton extends StatelessWidget {
  const _FullscreenIconButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.58),
      shape: const CircleBorder(),
      child: IconButton(
        tooltip: tooltip,
        icon: Icon(icon),
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}

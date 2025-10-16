import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ModernPlayerWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final VideoPlayerController? videoController;
  final String? videoTitle;
  final String? videoAuthor;
  final String? thumbnailUrl;
  final bool isLoading;

  const ModernPlayerWidget({
    super.key,
    required this.audioPlayer,
    this.videoController,
    this.videoTitle,
    this.videoAuthor,
    this.thumbnailUrl,
    this.isLoading = false,
  });

  @override
  State<ModernPlayerWidget> createState() => _ModernPlayerWidgetState();
}

class _ModernPlayerWidgetState extends State<ModernPlayerWidget> {
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  bool _isMuted = false;
  double _volume = 1.0;

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerStateSubscription;
  Timer? _videoUpdateTimer;

  @override
  void initState() {
    super.initState();
    _initAudioListeners();
    _initVideoListeners();
  }

  void _initAudioListeners() {
    widget.audioPlayer.getDuration().then((value) {
      if (value != null && mounted) {
        setState(() => _duration = value);
      }
    });

    widget.audioPlayer.getCurrentPosition().then((value) {
      if (value != null && mounted) {
        setState(() => _position = value);
      }
    });

    _durationSubscription = widget.audioPlayer.onDurationChanged.listen((
      duration,
    ) {
      if (mounted) setState(() => _duration = duration);
    });

    _positionSubscription = widget.audioPlayer.onPositionChanged.listen((
      position,
    ) {
      if (mounted) setState(() => _position = position);
    });

    _playerStateSubscription = widget.audioPlayer.onPlayerStateChanged.listen((
      state,
    ) {
      if (mounted) setState(() => _isPlaying = state == PlayerState.playing);
    });

    setState(
      () => _isPlaying = widget.audioPlayer.state == PlayerState.playing,
    );
  }

  void _initVideoListeners() {
    if (widget.videoController != null) {
      _videoUpdateTimer?.cancel();
      _videoUpdateTimer = Timer.periodic(const Duration(milliseconds: 100), (
        _,
      ) {
        if (widget.videoController != null &&
            widget.videoController!.value.isInitialized &&
            mounted) {
          setState(() {
            _position = widget.videoController!.value.position;
            _duration = widget.videoController!.value.duration;
            _isPlaying = widget.videoController!.value.isPlaying;
          });
        }
      });
    }
  }

  @override
  void didUpdateWidget(ModernPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoController != widget.videoController) {
      _initVideoListeners();
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerStateSubscription?.cancel();
    _videoUpdateTimer?.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    if (widget.videoController != null &&
        widget.videoController!.value.isInitialized) {
      if (_isPlaying) {
        widget.videoController!.pause();
      } else {
        widget.videoController!.play();
      }
    } else {
      if (_isPlaying) {
        widget.audioPlayer.pause();
      } else {
        widget.audioPlayer.resume();
      }
    }
  }

  void _seekTo(Duration position) {
    if (widget.videoController != null &&
        widget.videoController!.value.isInitialized) {
      widget.videoController!.seekTo(position);
    } else {
      widget.audioPlayer.seek(position);
    }
  }

  void _skip(int seconds) {
    final newPosition = _position + Duration(seconds: seconds);
    if (newPosition >= Duration.zero && newPosition <= _duration) {
      _seekTo(newPosition);
    }
  }

  void _toggleMute() {
    setState(() => _isMuted = !_isMuted);
    if (widget.videoController != null) {
      widget.videoController!.setVolume(_isMuted ? 0 : _volume);
    } else {
      widget.audioPlayer.setVolume(_isMuted ? 0 : _volume);
    }
  }

  void _setVolume(double volume) {
    setState(() => _volume = volume);
    if (widget.videoController != null) {
      widget.videoController!.setVolume(volume);
    } else {
      widget.audioPlayer.setVolume(volume);
    }
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [const Color(0xFF1A1A2E), const Color(0xFF16213E)]
              : [const Color(0xFFF8F9FA), const Color(0xFFE9ECEF)],
        ),
      ),
      child: SafeArea(
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
                      'Cargando...',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Video Player or Artwork
                  Expanded(child: _buildMediaDisplay(theme, isDark)),
                  // Controls
                  _buildControls(theme, isDark),
                ],
              ),
      ),
    );
  }

  Widget _buildMediaDisplay(ThemeData theme, bool isDark) {
    if (widget.videoController != null &&
        widget.videoController!.value.isInitialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: widget.videoController!.value.aspectRatio,
          child: VideoPlayer(widget.videoController!),
        ),
      );
    }

    // Audio mode - show artwork
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.3),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: widget.thumbnailUrl != null
                    ? Image.network(
                        widget.thumbnailUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildDefaultArtwork(theme);
                        },
                      )
                    : _buildDefaultArtwork(theme),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Text(
                  widget.videoTitle ?? 'Reproduciendo',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.videoAuthor ?? '',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
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
      child: const Center(
        child: Icon(Icons.music_note_rounded, size: 120, color: Colors.white),
      ),
    );
  }

  Widget _buildControls(ThemeData theme, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A2E) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress bar
          Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 4,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 8,
                  ),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 16,
                  ),
                  activeTrackColor: theme.colorScheme.primary,
                  inactiveTrackColor: theme.colorScheme.surfaceContainerHighest,
                  thumbColor: theme.colorScheme.primary,
                  overlayColor: theme.colorScheme.primary.withOpacity(0.2),
                ),
                child: Slider(
                  value: _duration.inMilliseconds > 0
                      ? _position.inMilliseconds.toDouble()
                      : 0,
                  max: _duration.inMilliseconds > 0
                      ? _duration.inMilliseconds.toDouble()
                      : 1,
                  onChanged: (value) {
                    _seekTo(Duration(milliseconds: value.toInt()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDuration(_position),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                    Text(
                      _formatDuration(_duration),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Main controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Skip backward
              IconButton(
                icon: const Icon(Icons.replay_10_rounded),
                iconSize: 36,
                onPressed: () => _skip(-10),
                color: theme.colorScheme.onSurface.withOpacity(0.8),
              ),
              // Previous (placeholder)
              IconButton(
                icon: const Icon(Icons.skip_previous_rounded),
                iconSize: 36,
                onPressed: null,
                color: theme.colorScheme.onSurface.withOpacity(0.4),
              ),
              // Play/Pause
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    size: 40,
                  ),
                  onPressed: _togglePlayPause,
                  color: Colors.white,
                ),
              ),
              // Next (placeholder)
              IconButton(
                icon: const Icon(Icons.skip_next_rounded),
                iconSize: 36,
                onPressed: null,
                color: theme.colorScheme.onSurface.withOpacity(0.4),
              ),
              // Skip forward
              IconButton(
                icon: const Icon(Icons.forward_10_rounded),
                iconSize: 36,
                onPressed: () => _skip(10),
                color: theme.colorScheme.onSurface.withOpacity(0.8),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Volume control
          Row(
            children: [
              IconButton(
                icon: Icon(
                  _isMuted || _volume == 0
                      ? Icons.volume_off_rounded
                      : _volume < 0.5
                      ? Icons.volume_down_rounded
                      : Icons.volume_up_rounded,
                ),
                onPressed: _toggleMute,
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 3,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 6,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 12,
                    ),
                    activeTrackColor: theme.colorScheme.primary.withOpacity(
                      0.7,
                    ),
                    inactiveTrackColor:
                        theme.colorScheme.surfaceContainerHighest,
                    thumbColor: theme.colorScheme.primary,
                  ),
                  child: Slider(
                    value: _isMuted ? 0 : _volume,
                    onChanged: (value) {
                      if (_isMuted) setState(() => _isMuted = false);
                      _setVolume(value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

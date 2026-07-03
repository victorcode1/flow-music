import 'package:flutter/foundation.dart';

const Object _trustedDurationUnset = Object();

@immutable
class ModernPlayerViewState {
  final Duration duration;
  final Duration? trustedDuration;
  final Duration position;
  final bool isPlaying;
  final bool isMuted;
  final double volume;

  const ModernPlayerViewState({
    this.duration = Duration.zero,
    this.trustedDuration,
    this.position = Duration.zero,
    this.isPlaying = false,
    this.isMuted = false,
    this.volume = 1,
  });

  Duration get effectiveDuration {
    final trusted = trustedDuration;
    if (trusted != null && trusted > Duration.zero) {
      return trusted;
    }
    return duration;
  }

  ModernPlayerViewState copyWith({
    Duration? duration,
    Object? trustedDuration = _trustedDurationUnset,
    Duration? position,
    bool? isPlaying,
    bool? isMuted,
    double? volume,
  }) {
    return ModernPlayerViewState(
      duration: duration ?? this.duration,
      trustedDuration: identical(trustedDuration, _trustedDurationUnset)
          ? this.trustedDuration
          : trustedDuration as Duration?,
      position: position ?? this.position,
      isPlaying: isPlaying ?? this.isPlaying,
      isMuted: isMuted ?? this.isMuted,
      volume: volume ?? this.volume,
    );
  }
}

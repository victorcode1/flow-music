import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final audioToolsControllerProvider =
    NotifierProvider<AudioToolsController, AudioToolsState>(
      AudioToolsController.new,
    );

class AudioToolsState {
  const AudioToolsState({
    this.playbackRate = 1,
    this.normalizeVolume = false,
  });

  final double playbackRate;
  final bool normalizeVolume;

  AudioToolsState copyWith({
    double? playbackRate,
    bool? normalizeVolume,
  }) {
    return AudioToolsState(
      playbackRate: playbackRate ?? this.playbackRate,
      normalizeVolume: normalizeVolume ?? this.normalizeVolume,
    );
  }
}

class AudioToolsController extends Notifier<AudioToolsState> {
  static const _rateKey = 'audio_tools_playback_rate';
  static const _normalizeKey = 'audio_tools_normalize_volume';

  Box get _box => Hive.box(settingsBoxName);

  AudioToolsState _readFromStorage() {
    return AudioToolsState(
      playbackRate: (_box.get(_rateKey) as num?)?.toDouble() ?? 1,
      normalizeVolume: _box.get(_normalizeKey) as bool? ?? false,
    );
  }

  @override
  AudioToolsState build() {
    return _readFromStorage();
  }

  Future<void> setPlaybackRate(double value) async {
    final next = value.clamp(0.5, 2.0).toDouble();
    await _box.put(_rateKey, next);
    state = state.copyWith(playbackRate: next);
  }

  Future<void> setNormalizeVolume(bool value) async {
    await _box.put(_normalizeKey, value);
    state = state.copyWith(normalizeVolume: value);
  }

}

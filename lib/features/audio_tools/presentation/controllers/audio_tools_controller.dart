import 'package:flow_music/core/audio/background_audio_handler.dart';
import 'package:flow_music/core/sync/cloud_sync_controller.dart';
import 'package:flow_music/features/settings/data/settings_providers.dart';
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
    this.smoothTransitions = true,
  });

  final double playbackRate;
  final bool normalizeVolume;
  final bool smoothTransitions;

  AudioToolsState copyWith({
    double? playbackRate,
    bool? normalizeVolume,
    bool? smoothTransitions,
  }) {
    return AudioToolsState(
      playbackRate: playbackRate ?? this.playbackRate,
      normalizeVolume: normalizeVolume ?? this.normalizeVolume,
      smoothTransitions: smoothTransitions ?? this.smoothTransitions,
    );
  }
}

class AudioToolsController extends Notifier<AudioToolsState> {
  static const _rateKey = 'audio_tools_playback_rate';
  static const _normalizeKey = 'audio_tools_normalize_volume';
  static const _smoothKey = 'audio_tools_smooth_transitions';
  static const _settingsUpdatedAtKey = 'settings_updated_at_ms';

  Box get _box => Hive.box(settingsBoxName);

  AudioToolsState _readFromStorage() {
    final smooth = _box.get(_smoothKey) as bool? ?? true;
    flowAudioHandler.setSmoothTransitions(smooth);
    return AudioToolsState(
      playbackRate: (_box.get(_rateKey) as num?)?.toDouble() ?? 1,
      normalizeVolume: _box.get(_normalizeKey) as bool? ?? false,
      smoothTransitions: smooth,
    );
  }

  @override
  AudioToolsState build() {
    ref.listen<CloudSyncState>(cloudSyncControllerProvider, (prev, next) {
      if (next is CloudSyncDone) state = _readFromStorage();
    });
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

  Future<void> setSmoothTransitions(bool value) async {
    await _box.put(_smoothKey, value);
    await _box.put(
      _settingsUpdatedAtKey,
      DateTime.now().millisecondsSinceEpoch,
    );
    flowAudioHandler.setSmoothTransitions(value);
    state = state.copyWith(smoothTransitions: value);
    ref
        .read(cloudSyncControllerProvider.notifier)
        .pushOne(ref.read(settingsSyncProvider));
  }
}

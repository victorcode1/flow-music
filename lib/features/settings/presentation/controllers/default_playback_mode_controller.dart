import 'package:flow_music/core/sync/cloud_sync_controller.dart';
import 'package:flow_music/features/settings/data/settings_providers.dart';
import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart';
import 'package:flow_music/features/song/presentation/controllers/song_controller.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final defaultPlaybackModeControllerProvider =
    NotifierProvider<DefaultPlaybackModeController, PlaybackMode>(
      DefaultPlaybackModeController.new,
    );

class DefaultPlaybackModeController extends Notifier<PlaybackMode> {
  static const _defaultPlaybackModeKey = 'default_playback_mode';
  static const _settingsUpdatedAtKey = 'settings_updated_at_ms';

  Box get _box => Hive.box(settingsBoxName);

  @override
  PlaybackMode build() {
    ref.listen<CloudSyncState>(cloudSyncControllerProvider, (prev, next) {
      if (next is CloudSyncDone) state = _read();
    });
    return _read();
  }

  Future<void> setMode(PlaybackMode mode) async {
    await _box.put(_defaultPlaybackModeKey, _encode(mode));
    await _box.put(
      _settingsUpdatedAtKey,
      DateTime.now().millisecondsSinceEpoch,
    );
    state = mode;
    ref
        .read(cloudSyncControllerProvider.notifier)
        .pushOne(ref.read(settingsSyncProvider));
  }

  PlaybackMode _read() {
    return _decode(_box.get(_defaultPlaybackModeKey));
  }

  PlaybackMode _decode(Object? raw) {
    return switch (raw) {
      'video' => PlaybackMode.video,
      _ => PlaybackMode.audio,
    };
  }

  String _encode(PlaybackMode mode) {
    return switch (mode) {
      PlaybackMode.audio => 'audio',
      PlaybackMode.video => 'video',
    };
  }
}

import 'package:flow_music/core/sync/cloud_sync_controller.dart';
import 'package:flow_music/features/settings/data/settings_providers.dart';
import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_download_quality_controller.g.dart';

const String _audioDownloadQualityKey = 'audio_download_quality';
const String _settingsUpdatedAtKey = 'settings_updated_at_ms';

/// Calidad preferida cuando el usuario descarga un audio. Filtra el stream
/// elegido de `manifest.audioOnly` por bitrate antes de bajarlo.
enum AudioDownloadQuality { high, medium, low }

@Riverpod(keepAlive: true)
class AudioDownloadQualityController extends _$AudioDownloadQualityController {
  @override
  AudioDownloadQuality build() {
    ref.listen<CloudSyncState>(cloudSyncControllerProvider, (prev, next) {
      if (next is CloudSyncDone) {
        state = _decode(
          Hive.box(settingsBoxName).get(_audioDownloadQualityKey),
        );
      }
    });
    final box = Hive.box(settingsBoxName);
    return _decode(box.get(_audioDownloadQualityKey));
  }

  Future<void> setQuality(AudioDownloadQuality quality) async {
    final box = Hive.box(settingsBoxName);
    await box.put(_audioDownloadQualityKey, _encode(quality));
    await box.put(_settingsUpdatedAtKey, DateTime.now().millisecondsSinceEpoch);
    state = quality;
    ref
        .read(cloudSyncControllerProvider.notifier)
        .pushOne(ref.read(settingsSyncProvider));
  }

  AudioDownloadQuality _decode(Object? raw) {
    return switch (raw) {
      'medium' => AudioDownloadQuality.medium,
      'low' => AudioDownloadQuality.low,
      _ => AudioDownloadQuality.high,
    };
  }

  String _encode(AudioDownloadQuality quality) {
    return switch (quality) {
      AudioDownloadQuality.high => 'high',
      AudioDownloadQuality.medium => 'medium',
      AudioDownloadQuality.low => 'low',
    };
  }
}

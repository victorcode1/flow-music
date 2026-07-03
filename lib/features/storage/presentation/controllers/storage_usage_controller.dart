import 'dart:async';

import 'package:flow_music/features/autoplay/data/audio_cache_stub.dart'
    if (dart.library.io) 'package:flow_music/features/autoplay/data/audio_cache_io.dart';
import 'package:flow_music/features/song/presentation/controllers/audio_download_writer_stub.dart'
    if (dart.library.io) 'package:flow_music/features/song/presentation/controllers/audio_download_writer_io.dart';
import 'package:flow_music/features/offline/data/offline_audio_store_stub.dart'
    if (dart.library.io) 'package:flow_music/features/offline/data/offline_audio_store_io.dart';
import 'package:flow_music/features/storage/data/storage_usage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final storageUsageControllerProvider =
    AsyncNotifierProvider<StorageUsageController, StorageUsage>(
      StorageUsageController.new,
    );

class StorageUsageController extends AsyncNotifier<StorageUsage> {
  @override
  FutureOr<StorageUsage> build() => _load();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_load);
  }

  Future<void> clearCache() async {
    await clearAudioCache();
    await refresh();
  }

  Future<void> clearOffline() async {
    await clearOfflineAudios();
    await refresh();
  }

  Future<StorageUsage> _load() async {
    final downloads = await listDownloadedAudios();
    var bytes = 0;
    for (final audio in downloads) {
      final info = await getDownloadedFileInfo(audio);
      bytes += info.sizeBytes;
    }
    final offlineAudios = await listOfflineAudios();
    return StorageUsage(
      downloadBytes: bytes,
      downloadCount: downloads.length,
      offlineBytes: await offlineAudioSizeBytes(),
      offlineCount: offlineAudios.length,
      cacheBytes: await audioCacheSizeBytes(),
    );
  }
}

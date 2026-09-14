/// Outcome of an attempt to cache an audio stream on disk.
class AudioCacheResult {
  const AudioCacheResult({this.filePath, this.diskFull = false});

  final String? filePath;
  final bool diskFull;

  static const AudioCacheResult empty = AudioCacheResult();
}

/// Download the audio at [url] into the on-disk autoplay cache and return the
/// local file path. Returns [AudioCacheResult.empty] on unsupported platforms
/// (e.g. web).
Future<AudioCacheResult> cacheAudioToDisk({
  required String videoId,
  required String url,
  Map<String, String> requestHeaders = const {},
  int? rangeEnd,
  String? fileExtension,
}) async {
  return AudioCacheResult.empty;
}

/// Best-effort lookup for an existing cached audio file for [videoId].
Future<String?> cachedAudioPath(String videoId) async => null;

/// Removes audio cache files that haven't been touched in [olderThan].
Future<void> trimAudioCache({
  Duration olderThan = const Duration(days: 7),
  int maxFiles = 30,
}) async {}

/// Delete the entire autoplay audio cache directory. Called on app close /
/// startup so cached bytes never outlive a session.
Future<void> clearAudioCache() async {}

Future<int> audioCacheSizeBytes() async {
  return 0;
}

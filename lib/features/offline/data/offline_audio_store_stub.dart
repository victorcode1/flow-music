import 'package:flow_music/features/library/data/downloaded_audio.dart';

Future<DownloadedAudio> saveOfflineAudioStream({
  required String videoId,
  required String title,
  required String author,
  required String thumbnailUrl,
  required String extension,
  required int totalBytes,
  required Stream<List<int>> chunks,
  required void Function(double progress) onProgress,
}) {
  throw UnsupportedError('Offline audio is not supported on this platform.');
}

Future<DownloadedAudio?> getOfflineAudio(String videoId) async {
  return null;
}

Future<List<DownloadedAudio>> listOfflineAudios() async {
  return const [];
}

Future<bool> deleteOfflineAudio(DownloadedAudio audio) async {
  return false;
}

Future<void> clearOfflineAudios() async {}

Future<int> offlineAudioSizeBytes() async {
  return 0;
}

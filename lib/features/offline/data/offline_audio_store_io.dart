import 'dart:convert';
import 'dart:io';

import 'package:flow_music/features/library/data/downloaded_audio.dart';
import 'package:path_provider/path_provider.dart';

const String _offlineSubdirectory = 'offline_audio';

Future<DownloadedAudio> saveOfflineAudioStream({
  required String videoId,
  required String title,
  required String author,
  required String thumbnailUrl,
  required String extension,
  required int totalBytes,
  required Stream<List<int>> chunks,
  required void Function(double progress) onProgress,
}) async {
  IOSink? output;
  File? outputFile;

  try {
    final directory = await _offlineDirectory();
    final existing = await getOfflineAudio(videoId);
    if (existing != null) return existing;

    final resolvedExtension = extension.toLowerCase() == 'mp4'
        ? 'm4a'
        : extension;
    outputFile = File(
      '${directory.path}${Platform.pathSeparator}${_safeFileName(videoId, resolvedExtension)}',
    );
    output = outputFile.openWrite(mode: FileMode.writeOnly);

    var downloadedBytes = 0;
    var lastProgressUpdate = DateTime.now();

    await for (final chunk in chunks) {
      downloadedBytes += chunk.length;
      output.add(chunk);

      if (totalBytes > 0) {
        final now = DateTime.now();
        if (now.difference(lastProgressUpdate).inMilliseconds >= 120 ||
            downloadedBytes == totalBytes) {
          onProgress((downloadedBytes / totalBytes).clamp(0, 1).toDouble());
          lastProgressUpdate = now;
        }
      }
    }

    await output.flush();
    await output.close();
    output = null;

    final offlineAudio = DownloadedAudio(
      videoId: videoId,
      title: title,
      author: author,
      thumbnailUrl: thumbnailUrl,
      filePath: outputFile.path,
      downloadedAt: DateTime.now(),
    );
    await _writeMetadata(directory, offlineAudio);
    return offlineAudio;
  } catch (_) {
    try {
      await output?.close();
    } catch (_) {}
    try {
      if (outputFile != null && await outputFile.exists()) {
        await outputFile.delete();
      }
    } catch (_) {}
    rethrow;
  }
}

Future<DownloadedAudio?> getOfflineAudio(String videoId) async {
  if (videoId.isEmpty) return null;
  final directory = await _offlineDirectory();
  final metadata = await _readMetadata(directory, videoId);
  if (metadata != null && await File(metadata.filePath).exists()) {
    return metadata;
  }
  return null;
}

Future<List<DownloadedAudio>> listOfflineAudios() async {
  final directory = await _offlineDirectory();
  final audios = <DownloadedAudio>[];
  await for (final entity in directory.list()) {
    if (entity is! File || !entity.path.endsWith('.json')) continue;
    final metadata = await _readMetadataFile(entity);
    if (metadata != null && await File(metadata.filePath).exists()) {
      audios.add(metadata);
    }
  }
  audios.sort((a, b) => b.downloadedAt.compareTo(a.downloadedAt));
  return audios;
}

Future<bool> deleteOfflineAudio(DownloadedAudio audio) async {
  var deletedSomething = false;
  try {
    if (audio.filePath.isNotEmpty) {
      final file = File(audio.filePath);
      if (await file.exists()) {
        await file.delete();
        deletedSomething = true;
      }
    }
  } catch (_) {}

  try {
    final metadata = _metadataFile(await _offlineDirectory(), audio.videoId);
    if (await metadata.exists()) {
      await metadata.delete();
      deletedSomething = true;
    }
  } catch (_) {}

  return deletedSomething;
}

Future<void> clearOfflineAudios() async {
  try {
    final directory = await _offlineDirectory(create: false);
    if (await directory.exists()) {
      await directory.delete(recursive: true);
    }
  } catch (_) {}
}

Future<int> offlineAudioSizeBytes() async {
  try {
    final directory = await _offlineDirectory();
    var total = 0;
    await for (final entity in directory.list()) {
      if (entity is! File) continue;
      try {
        total += await entity.length();
      } catch (_) {}
    }
    return total;
  } catch (_) {
    return 0;
  }
}

Future<Directory> _offlineDirectory({bool create = true}) async {
  final base = await getApplicationSupportDirectory();
  final directory = Directory(
    '${base.path}${Platform.pathSeparator}$_offlineSubdirectory',
  );
  if (create && !await directory.exists()) {
    await directory.create(recursive: true);
  }
  return directory;
}

String _safeFileName(String videoId, String extension) {
  final base = _safeBaseName(videoId).isEmpty ? 'song' : _safeBaseName(videoId);
  return '$base.$extension';
}

String _safeBaseName(String value) {
  return value
      .replaceAll(RegExp(r'[\\/:*?"<>|]'), '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}

File _metadataFile(Directory directory, String videoId) {
  return File(
    '${directory.path}${Platform.pathSeparator}${_safeBaseName(videoId)}.json',
  );
}

Future<void> _writeMetadata(
  Directory directory,
  DownloadedAudio offlineAudio,
) async {
  await _metadataFile(
    directory,
    offlineAudio.videoId,
  ).writeAsString(jsonEncode(offlineAudio.toJson()));
}

Future<DownloadedAudio?> _readMetadata(
  Directory directory,
  String videoId,
) async {
  return _readMetadataFile(_metadataFile(directory, videoId));
}

Future<DownloadedAudio?> _readMetadataFile(File file) async {
  try {
    if (!await file.exists()) return null;
    final json = jsonDecode(await file.readAsString());
    if (json is! Map<String, dynamic>) return null;
    return DownloadedAudio.fromJson(json);
  } catch (_) {
    return null;
  }
}

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

const String _cacheSubdirectory = 'autoplay_cache';

class AudioCacheResult {
  const AudioCacheResult({this.filePath, this.diskFull = false});

  final String? filePath;
  final bool diskFull;

  static const AudioCacheResult empty = AudioCacheResult();
}

Future<AudioCacheResult> cacheAudioToDisk({
  required String videoId,
  required String url,
}) async {
  if (videoId.isEmpty || url.isEmpty) return AudioCacheResult.empty;

  File? tempFile;
  try {
    final directory = await _cacheDirectory();
    final existing = await _findCachedFile(directory, videoId);
    if (existing != null) {
      try {
        await existing.setLastAccessed(DateTime.now());
      } catch (_) {
        // Ignore touch errors; file is still usable.
      }
      return AudioCacheResult(filePath: existing.path);
    }

    final client = http.Client();
    final http.StreamedResponse response;
    try {
      final request = http.Request('GET', Uri.parse(url));
      response = await client.send(request);
    } catch (_) {
      client.close();
      rethrow;
    }
    if (response.statusCode < 200 || response.statusCode >= 300) {
      client.close();
      return AudioCacheResult.empty;
    }

    final extension = _extensionFromContentType(
      response.headers['content-type'],
    );
    final uniqueSuffix =
        '${DateTime.now().microsecondsSinceEpoch}_'
        '${identityHashCode(response)}';
    tempFile = File(
      '${directory.path}${Platform.pathSeparator}$videoId.$uniqueSuffix.partial',
    );
    final finalFile = File(
      '${directory.path}${Platform.pathSeparator}$videoId.$extension',
    );

    final sink = tempFile.openWrite();
    try {
      await response.stream.pipe(sink);
    } finally {
      try {
        await sink.flush();
        await sink.close();
      } catch (_) {
        // ignore
      }
      client.close();
    }

    if (!await tempFile.exists()) {
      return AudioCacheResult.empty;
    }

    if (await finalFile.exists()) {
      // Another concurrent call already produced the final file; discard ours.
      await _safeDelete(tempFile);
      tempFile = null;
      return AudioCacheResult(filePath: finalFile.path);
    }

    try {
      await tempFile.rename(finalFile.path);
    } on FileSystemException {
      // Race: another caller renamed in between our exists() check and rename.
      if (await finalFile.exists()) {
        await _safeDelete(tempFile);
        tempFile = null;
        return AudioCacheResult(filePath: finalFile.path);
      }
      rethrow;
    }
    tempFile = null;
    debugPrint('Audio cached at ${finalFile.path}');
    return AudioCacheResult(filePath: finalFile.path);
  } on FileSystemException catch (e, stackTrace) {
    debugPrint('Filesystem error caching $videoId: $e');
    debugPrint('$stackTrace');
    await _safeDelete(tempFile);
    if (_looksLikeDiskFull(e)) {
      return const AudioCacheResult(diskFull: true);
    }
    return AudioCacheResult.empty;
  } on http.ClientException catch (e) {
    // Transient network error (connection reset, peer closed mid-stream, etc).
    // Routine when prefetching against googlevideo — the next track will try
    // again, no actionable stack trace.
    debugPrint('Network error caching $videoId: ${e.message}');
    await _safeDelete(tempFile);
    return AudioCacheResult.empty;
  } on SocketException catch (e) {
    debugPrint('Socket error caching $videoId: ${e.message}');
    await _safeDelete(tempFile);
    return AudioCacheResult.empty;
  } catch (e, stackTrace) {
    debugPrint('Failed to cache audio for $videoId: $e');
    debugPrint('$stackTrace');
    await _safeDelete(tempFile);
    return AudioCacheResult.empty;
  }
}

Future<String?> cachedAudioPath(String videoId) async {
  if (videoId.isEmpty) return null;
  final directory = await _cacheDirectory();
  final file = await _findCachedFile(directory, videoId);
  return file?.path;
}

Future<void> trimAudioCache({
  Duration olderThan = const Duration(days: 7),
  int maxFiles = 30,
}) async {
  try {
    final directory = await _cacheDirectory();
    final entries = <File>[];
    await for (final entity in directory.list()) {
      if (entity is File && !entity.path.endsWith('.partial')) {
        entries.add(entity);
      }
    }

    final cutoff = DateTime.now().subtract(olderThan);
    for (final file in entries) {
      try {
        final modified = await file.lastModified();
        if (modified.isBefore(cutoff)) {
          await file.delete();
        }
      } catch (_) {}
    }

    final survivors = <File>[];
    await for (final entity in directory.list()) {
      if (entity is File && !entity.path.endsWith('.partial')) {
        survivors.add(entity);
      }
    }
    if (survivors.length <= maxFiles) return;

    survivors.sort((a, b) {
      return a.statSync().modified.compareTo(b.statSync().modified);
    });
    final toDrop = survivors.length - maxFiles;
    for (var i = 0; i < toDrop; i++) {
      try {
        await survivors[i].delete();
      } catch (_) {}
    }
  } catch (e) {
    debugPrint('Failed to trim audio cache: $e');
  }
}

Future<void> clearAudioCache() async {
  try {
    final base = await getTemporaryDirectory();
    final directory = Directory(
      '${base.path}${Platform.pathSeparator}$_cacheSubdirectory',
    );
    if (await directory.exists()) {
      await directory.delete(recursive: true);
      debugPrint('Autoplay cache cleared at ${directory.path}');
    }
  } catch (e) {
    debugPrint('Failed to clear audio cache: $e');
  }
}

Future<int> audioCacheSizeBytes() async {
  try {
    final directory = await _cacheDirectory();
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

Future<Directory> _cacheDirectory() async {
  final base = await getTemporaryDirectory();
  final directory = Directory(
    '${base.path}${Platform.pathSeparator}$_cacheSubdirectory',
  );
  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }
  return directory;
}

Future<File?> _findCachedFile(Directory directory, String videoId) async {
  await for (final entity in directory.list()) {
    if (entity is! File) continue;
    final name = entity.path.split(Platform.pathSeparator).last;
    if (name.endsWith('.partial')) continue;
    final dot = name.lastIndexOf('.');
    final base = dot == -1 ? name : name.substring(0, dot);
    if (base == videoId) return entity;
  }
  return null;
}

String _extensionFromContentType(String? contentType) {
  if (contentType == null) return 'm4a';
  final lower = contentType.toLowerCase();
  if (lower.contains('mp4') || lower.contains('m4a') || lower.contains('aac')) {
    return 'm4a';
  }
  if (lower.contains('webm') || lower.contains('opus')) return 'webm';
  if (lower.contains('mpeg') || lower.contains('mp3')) return 'mp3';
  return 'audio';
}

bool _looksLikeDiskFull(FileSystemException e) {
  // ENOSPC on POSIX, ERROR_DISK_FULL (112) / ERROR_HANDLE_DISK_FULL (39) on
  // Windows. Also fall back to checking the human-readable message.
  final code = e.osError?.errorCode;
  if (code == 28 || code == 39 || code == 112) return true;
  final blob = '${e.message} ${e.osError?.message ?? ''}'.toLowerCase();
  return blob.contains('no space') ||
      blob.contains('disk full') ||
      blob.contains('not enough space');
}

Future<void> _safeDelete(File? file) async {
  if (file == null) return;
  try {
    if (await file.exists()) await file.delete();
  } catch (_) {}
}

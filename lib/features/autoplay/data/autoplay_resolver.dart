import 'dart:convert';

import 'package:flow_music/features/autoplay/data/resolved_audio.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/features/search/data/repositories/piped_video_duration.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

const _pipedApiBaseUrl = 'https://api.piped.private.coffee';

Future<ResolvedAudio?> resolveAudioFor(
  YouTubeSearchSuggestion suggestion,
) async {
  final videoId = suggestion.videoId;
  if (videoId.isEmpty) return null;

  try {
    if (!kIsWeb) {
      final resolved = await _tryResolveViaYoutubeExplode(suggestion);
      if (resolved != null) return resolved;
    }

    return await _resolveViaPiped(suggestion);
  } catch (error, stackTrace) {
    debugPrint('Failed to prefetch ${suggestion.videoId}: $error');
    debugPrint('$stackTrace');
    return null;
  }
}

Future<ResolvedAudio?> _tryResolveViaYoutubeExplode(
  YouTubeSearchSuggestion suggestion,
) async {
  try {
    return await _resolveViaYoutubeExplode(suggestion);
  } catch (error, stackTrace) {
    debugPrint(
      'youtube_explode prefetch failed for ${suggestion.videoId}, falling back to Piped: $error',
    );
    debugPrint('$stackTrace');
    return null;
  }
}

Future<ResolvedAudio?> _resolveViaYoutubeExplode(
  YouTubeSearchSuggestion suggestion,
) async {
  final yt = YoutubeExplode();
  try {
    final video = await yt.videos.get(suggestion.videoId);
    final manifest = await yt.videos.streamsClient.getManifest(
      suggestion.videoId,
    );
    if (_needsAppleLocalCache) {
      if (manifest.streams.isEmpty) return null;
      final firstStream = manifest.streams.first;
      if (firstStream.container != StreamContainer.mp4 ||
          (firstStream is! MuxedStreamInfo &&
              firstStream is! AudioOnlyStreamInfo)) {
        return null;
      }
      return ResolvedAudio(
        suggestion: suggestion,
        audioUrl: firstStream.url.toString(),
        mimeType: '${firstStream.codec.type}/${firstStream.codec.subtype}',
        requestHeaders: YoutubeHttpClient.defaultHeaders,
        rangeEnd: firstStream.size.totalBytes - 1,
        fileExtension: firstStream.container.name,
        title: suggestion.displayText,
        author: suggestion.channelTitle,
        thumbnailUrl: suggestion.thumbnailUrl,
        duration: suggestion.duration ?? video.duration,
      );
    }

    if (manifest.audioOnly.isEmpty) return null;

    final preferred = manifest.audioOnly.where(
      (stream) =>
          stream.container == StreamContainer.mp4 ||
          stream.codec.subtype == 'mp4a.40.2',
    );
    final audioStream = (preferred.isEmpty ? manifest.audioOnly : preferred)
        .withHighestBitrate();

    return ResolvedAudio(
      suggestion: suggestion,
      audioUrl: audioStream.url.toString(),
      mimeType: '${audioStream.codec.type}/${audioStream.codec.subtype}',
      title: suggestion.displayText,
      author: suggestion.channelTitle,
      thumbnailUrl: suggestion.thumbnailUrl,
      duration: _resolveAudioDuration(
        streamUri: audioStream.url,
        knownDuration: suggestion.duration,
        fallback: video.duration,
      ),
    );
  } finally {
    yt.close();
  }
}

bool get _needsAppleLocalCache =>
    !kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS);

Future<ResolvedAudio?> _resolveViaPiped(
  YouTubeSearchSuggestion suggestion,
) async {
  final uri = Uri.parse('$_pipedApiBaseUrl/streams/${suggestion.videoId}');
  final response = await http.get(uri);
  if (response.statusCode < 200 || response.statusCode >= 300) return null;

  final decoded = jsonDecode(response.body);
  if (decoded is! Map<String, dynamic>) return null;

  final streams = decoded['audioStreams'];
  if (streams is! List || streams.isEmpty) return null;

  final typed = streams
      .whereType<Map>()
      .map((stream) => Map<String, dynamic>.from(stream))
      .where((stream) => (stream['url'] as String? ?? '').isNotEmpty)
      .toList();
  if (typed.isEmpty) return null;

  typed.sort((a, b) {
    final aOpus = a['format'] == 'WEBMA_OPUS' ? 1 : 0;
    final bOpus = b['format'] == 'WEBMA_OPUS' ? 1 : 0;
    if (aOpus != bOpus) return bOpus.compareTo(aOpus);
    final aBitrate = a['bitrate'] as int? ?? 0;
    final bBitrate = b['bitrate'] as int? ?? 0;
    return bBitrate.compareTo(aBitrate);
  });

  final stream = typed.first;
  return ResolvedAudio(
    suggestion: suggestion,
    audioUrl: stream['url'] as String,
    mimeType: stream['mimeType'] as String? ?? 'audio/webm',
    title: decoded['title'] as String? ?? suggestion.displayText,
    author: decoded['uploader'] as String? ?? suggestion.channelTitle,
    thumbnailUrl: 'https://i.ytimg.com/vi/${suggestion.videoId}/hqdefault.jpg',
    duration: suggestion.duration ?? parsePipedDuration(decoded['duration']),
  );
}

Duration? _resolveAudioDuration({
  required Uri streamUri,
  Duration? knownDuration,
  Duration? fallback,
}) {
  final canonical = knownDuration ?? fallback;
  if (canonical != null && canonical > Duration.zero) {
    return canonical;
  }
  return _parseStreamDuration(streamUri);
}

Duration? _parseStreamDuration(Uri uri) {
  final rawDuration = uri.queryParameters['dur'];
  if (rawDuration == null || rawDuration.isEmpty) return null;

  final seconds = double.tryParse(rawDuration);
  if (seconds == null || !seconds.isFinite || seconds <= 0) return null;

  return Duration(milliseconds: (seconds * 1000).round());
}

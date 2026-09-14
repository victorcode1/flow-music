import 'dart:convert';

import 'package:flow_music/features/autoplay/data/youtube_access_state.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/features/search/data/repositories/piped_video_duration.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

const _pipedApiBaseUrl = 'https://api.piped.private.coffee';
const _minSongDuration = Duration(minutes: 1);
const _maxSongDuration = Duration(minutes: 12);
const _maxRelatedTracks = 15;

/// Pistas que YouTube considera relacionadas con [seed]: el mismo pozo que
/// alimenta el "mix" de youtube.com.
///
/// Es la fuente preferida para rellenar la cola porque se mantiene en la misma
/// linea musical de la cancion que el usuario toco. La busqueda por texto, en
/// cambio, se va desviando de estilo a medida que la cola avanza.
///
/// Devuelve una lista vacia (nunca lanza) cuando no hay relacionados o la red
/// falla, para que el llamador pueda caer al plan B sin romper la reproduccion.
Future<List<YouTubeSearchSuggestion>> fetchRelatedTracks(
  YouTubeSearchSuggestion seed,
) async {
  if (seed.videoId.isEmpty) return const [];

  if (!kIsWeb && !isYoutubeRateLimited) {
    final viaExplode = await _relatedViaYoutubeExplode(seed.videoId);
    if (viaExplode.isNotEmpty) return viaExplode;
  }
  return _relatedViaPiped(seed.videoId);
}

Future<List<YouTubeSearchSuggestion>> _relatedViaYoutubeExplode(
  String videoId,
) async {
  final yt = YoutubeExplode();
  try {
    final video = await yt.videos.get(videoId);
    final related = await yt.videos.getRelatedVideos(video);
    if (related == null || related.isEmpty) return const [];

    final tracks = <YouTubeSearchSuggestion>[];
    final seen = <String>{videoId};
    for (final item in related) {
      final id = item.id.value;
      if (id.isEmpty || !seen.add(id)) continue;
      if (!_isPlayableDuration(item.duration)) continue;
      tracks.add(YouTubeSearchSuggestion.fromVideo(item));
      if (tracks.length >= _maxRelatedTracks) break;
    }
    return tracks;
  } catch (error) {
    reportYoutubeFailure(error);
    debugPrint(
      'Related tracks via youtube_explode failed for $videoId: $error',
    );
    return const [];
  } finally {
    yt.close();
  }
}

Future<List<YouTubeSearchSuggestion>> _relatedViaPiped(String videoId) async {
  try {
    final uri = Uri.parse('$_pipedApiBaseUrl/streams/$videoId');
    final response = await http.get(uri);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return const [];
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) return const [];
    final related = decoded['relatedStreams'];
    if (related is! List) return const [];

    final tracks = <YouTubeSearchSuggestion>[];
    final seen = <String>{videoId};
    for (final item in related) {
      if (item is! Map) continue;
      final typed = Map<String, dynamic>.from(item);
      if (typed['type'] != 'stream') continue;

      final id = extractPipedVideoId(typed['url']);
      final title = typed['title'] as String? ?? '';
      if (id.isEmpty || title.isEmpty || !seen.add(id)) continue;

      final duration = parsePipedDuration(typed['duration']);
      if (!_isPlayableDuration(duration)) continue;

      tracks.add(
        YouTubeSearchSuggestion(
          videoId: id,
          displayText: title,
          channelTitle: typed['uploaderName'] as String? ?? '',
          thumbnailUrl: 'https://i.ytimg.com/vi/$id/hqdefault.jpg',
          duration: duration,
        ),
      );
      if (tracks.length >= _maxRelatedTracks) break;
    }
    return tracks;
  } catch (error) {
    debugPrint('Related tracks via Piped failed for $videoId: $error');
    return const [];
  }
}

/// Deja pasar las pistas sin duracion conocida: filtrarlas descartaria
/// canciones validas que la fuente simplemente no anoto.
bool _isPlayableDuration(Duration? duration) {
  if (duration == null) return true;
  return duration >= _minSongDuration && duration <= _maxSongDuration;
}

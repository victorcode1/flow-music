import 'dart:convert';

import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/features/search/data/repositories/piped_video_duration.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const _pipedApiBaseUrl = 'https://api.piped.private.coffee';
const _minSongDuration = Duration(minutes: 1);
const _maxSongDuration = Duration(minutes: 12);
const _maxMixTracks = 50;

/// Una pagina del "mix" que YouTube arma alrededor de una cancion: la misma
/// radio infinita que sale al tocar "Reproducir mix" en youtube.com.
///
/// Es la mejor fuente para la cola porque YouTube ya la curo para que no se
/// salga del genero de la semilla, a diferencia de los "relacionados" (que
/// mezclan reacciones, entrevistas y recopilatorios) y de la busqueda por
/// texto (que se desvia de estilo a medida que la cola avanza).
class MixPlaylistPage {
  const MixPlaylistPage({
    required this.playlistId,
    required this.tracks,
    this.nextPageToken,
  });

  /// Id del mix en YouTube (`RD<videoId>`).
  final String playlistId;

  final List<YouTubeSearchSuggestion> tracks;

  /// Token opaco de Piped para pedir la continuacion del mismo mix. Mientras
  /// exista, la cola puede seguir creciendo sin cambiar de linea musical.
  final String? nextPageToken;

  bool get isEmpty => tracks.isEmpty;
  bool get hasNextPage => (nextPageToken ?? '').isNotEmpty;

  static const MixPlaylistPage empty = MixPlaylistPage(
    playlistId: '',
    tracks: [],
  );
}

/// Id del mix autogenerado de [videoId]. YouTube lo forma con el prefijo `RD`.
String mixPlaylistIdFor(String videoId) => 'RD$videoId';

/// Primera pagina del mix de [seed].
///
/// Devuelve [MixPlaylistPage.empty] (nunca lanza) cuando el video no tiene mix
/// o la red falla, para que el llamador pueda caer al plan B sin romper la
/// reproduccion.
Future<MixPlaylistPage> fetchMixPlaylist(YouTubeSearchSuggestion seed) async {
  if (seed.videoId.isEmpty) return MixPlaylistPage.empty;

  final playlistId = mixPlaylistIdFor(seed.videoId);
  return _fetchMix(
    Uri.parse('$_pipedApiBaseUrl/playlists/$playlistId'),
    playlistId: playlistId,
  );
}

/// Continuacion del mismo mix, usando el token que trajo la pagina anterior.
Future<MixPlaylistPage> fetchMixPlaylistPage({
  required String playlistId,
  required String nextPageToken,
}) async {
  if (playlistId.isEmpty || nextPageToken.isEmpty) {
    return MixPlaylistPage.empty;
  }

  final uri = Uri.parse(
    '$_pipedApiBaseUrl/nextpage/playlists/$playlistId',
  ).replace(queryParameters: {'nextpage': nextPageToken});
  return _fetchMix(uri, playlistId: playlistId);
}

Future<MixPlaylistPage> _fetchMix(Uri uri, {required String playlistId}) async {
  try {
    final response = await http.get(uri);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      debugPrint(
        'Mix playlist $playlistId failed: HTTP ${response.statusCode}',
      );
      return MixPlaylistPage.empty;
    }
    return parseMixPlaylistResponse(response.body, playlistId: playlistId);
  } catch (error) {
    debugPrint('Mix playlist $playlistId failed: $error');
    return MixPlaylistPage.empty;
  }
}

/// Lee la respuesta de Piped (`/playlists` y `/nextpage/playlists` comparten
/// forma). Expuesto para poder probar el parseo sin tocar la red.
MixPlaylistPage parseMixPlaylistResponse(
  String body, {
  required String playlistId,
}) {
  final decoded = jsonDecode(body);
  if (decoded is! Map<String, dynamic>) return MixPlaylistPage.empty;

  final streams = decoded['relatedStreams'];
  if (streams is! List) return MixPlaylistPage.empty;

  final tracks = <YouTubeSearchSuggestion>[];
  final seen = <String>{};
  for (final item in streams) {
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
    if (tracks.length >= _maxMixTracks) break;
  }

  final token = decoded['nextpage'];
  return MixPlaylistPage(
    playlistId: playlistId,
    tracks: tracks,
    nextPageToken: token is String && token.isNotEmpty ? token : null,
  );
}

/// Deja pasar las pistas sin duracion conocida: filtrarlas descartaria
/// canciones validas que la fuente simplemente no anoto.
bool _isPlayableDuration(Duration? duration) {
  if (duration == null) return true;
  return duration >= _minSongDuration && duration <= _maxSongDuration;
}

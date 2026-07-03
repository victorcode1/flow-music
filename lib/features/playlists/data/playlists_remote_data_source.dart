import 'package:flow_music/features/auth/data/remote/authenticated_function_client.dart';
import 'package:flow_music/features/playlists/data/playlist.dart';

/// Acceso de bajo nivel a la copia remota de listas de reproduccion.
///
/// Estructura: users/{uid}/playlists/{playlistId} -> Playlist.toJson()
class PlaylistsRemoteDataSource {
  PlaylistsRemoteDataSource(this._client);

  final AuthenticatedFunctionClient _client;

  Future<List<Playlist>> readAll(String uid) async {
    final json = await _client.post('userDataRead', {'resource': 'playlists'});
    return _items(json).map((item) => Playlist.fromJson(item)).toList();
  }

  Future<void> upsert(String uid, Playlist playlist) async {
    if (playlist.id.isEmpty) return;
    await _client.post('userDataUpsert', {
      'resource': 'playlists',
      'id': playlist.id,
      'data': playlist.toJson(),
    });
  }

  Future<void> remove(String uid, String playlistId) async {
    if (playlistId.isEmpty) return;
    await _client.post('userDataDelete', {
      'resource': 'playlists',
      'id': playlistId,
    });
  }

  Future<void> replaceAll(String uid, List<Playlist> playlists) async {
    await _client.post('userDataReplaceAll', {
      'resource': 'playlists',
      'items': playlists
          .where((playlist) => playlist.id.isNotEmpty)
          .map((playlist) => playlist.toJson())
          .toList(),
    });
  }
}

List<Map<String, dynamic>> _items(Map<String, dynamic> json) {
  final raw = json['items'];
  if (raw is! List) return const <Map<String, dynamic>>[];
  return raw
      .whereType<Map>()
      .map((item) => Map<String, dynamic>.from(item))
      .toList();
}

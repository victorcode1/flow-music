import 'package:flow_music/features/auth/data/remote/authenticated_function_client.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';

/// Estructura: users/{uid}/radioPlaylists/{playlistId} -> RadioPlaylist.toJson()
class RadioPlaylistsRemoteDataSource {
  RadioPlaylistsRemoteDataSource(this._client);

  final AuthenticatedFunctionClient _client;

  Future<List<RadioPlaylist>> readAll(String uid) async {
    final json = await _client.post('userDataRead', {
      'resource': 'radioPlaylists',
    });
    return _items(json).map((item) => RadioPlaylist.fromJson(item)).toList();
  }

  Future<void> upsert(String uid, RadioPlaylist playlist) async {
    if (playlist.id.isEmpty) return;
    await _client.post('userDataUpsert', {
      'resource': 'radioPlaylists',
      'id': playlist.id,
      'data': playlist.toJson(),
    });
  }

  Future<void> remove(String uid, String playlistId) async {
    if (playlistId.isEmpty) return;
    await _client.post('userDataDelete', {
      'resource': 'radioPlaylists',
      'id': playlistId,
    });
  }

  Future<void> replaceAll(String uid, List<RadioPlaylist> playlists) async {
    await _client.post('userDataReplaceAll', {
      'resource': 'radioPlaylists',
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

import 'package:flow_music/features/auth/data/remote/authenticated_function_client.dart';
import 'package:flow_music/features/favorites/data/favorite_song.dart';

/// Acceso de bajo nivel a la copia remota de favoritos en Firestore.
///
/// Estructura del documento:
///   users/{uid}/favorites/{videoId} -> { videoId, title, author,
///     thumbnailUrl, addedAt }
class FavoritesRemoteDataSource {
  FavoritesRemoteDataSource(this._client);

  final AuthenticatedFunctionClient _client;

  Future<List<FavoriteSong>> readAll(String uid) async {
    final json = await _client.post('userDataRead', {'resource': 'favorites'});
    return _items(
      json,
    ).map((item) => FavoriteSong.fromJson(item)).toList(growable: false);
  }

  Future<void> upsert(String uid, FavoriteSong favorite) async {
    if (favorite.videoId.isEmpty) return;
    await _client.post('userDataUpsert', {
      'resource': 'favorites',
      'id': favorite.videoId,
      'data': favorite.toJson(),
    });
  }

  Future<void> remove(String uid, String videoId) async {
    if (videoId.isEmpty) return;
    await _client.post('userDataDelete', {
      'resource': 'favorites',
      'id': videoId,
    });
  }

  Future<void> replaceAll(String uid, List<FavoriteSong> favorites) async {
    await _client.post('userDataReplaceAll', {
      'resource': 'favorites',
      'items': favorites
          .where((favorite) => favorite.videoId.isNotEmpty)
          .map((favorite) => favorite.toJson())
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

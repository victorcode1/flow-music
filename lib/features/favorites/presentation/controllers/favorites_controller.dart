import 'package:flow_music/core/sync/cloud_sync_controller.dart';
import 'package:flow_music/features/favorites/data/favorite_song.dart';
import 'package:flow_music/features/favorites/data/favorites_providers.dart';
import 'package:flow_music/features/favorites/data/favorites_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_controller.g.dart';

/// Notifier que expone la lista actual de favoritos y permite agregar /
/// quitar canciones.
///
/// La lista se carga sincronicamente desde Hive en `build` porque la caja
/// se abre antes de `runApp` (ver `main.dart`). Cuando hay usuario
/// autenticado, cada mutacion empuja best-effort la copia completa a
/// Firestore; tras un pull remoto, el controller re-lee Hive para reflejar
/// los datos sincronizados.
@Riverpod(keepAlive: true)
class FavoritesController extends _$FavoritesController {
  final FavoritesRepository _repository = const FavoritesRepository();

  @override
  List<FavoriteSong> build() {
    ref.listen<CloudSyncState>(cloudSyncControllerProvider, (prev, next) {
      if (next is CloudSyncDone) {
        state = _repository.readAll();
      }
    });
    return _repository.readAll();
  }

  /// `true` si la cancion identificada por [videoId] esta en favoritos.
  bool isFavorite(String videoId) {
    if (videoId.isEmpty) return false;
    return state.any((favorite) => favorite.videoId == videoId);
  }

  /// Agrega un favorito si no existe. Si ya estaba, no hace nada.
  Future<void> add({
    required String videoId,
    required String title,
    required String author,
    required String thumbnailUrl,
  }) async {
    if (videoId.isEmpty) return;
    if (isFavorite(videoId)) return;
    final favorite = FavoriteSong(
      videoId: videoId,
      title: title,
      author: author,
      thumbnailUrl: thumbnailUrl,
      addedAt: DateTime.now(),
    );
    await _repository.add(favorite);
    state = [favorite, ...state];
    _pushRemote();
  }

  /// Quita un favorito por `videoId`. No-op si no existe.
  Future<void> remove(String videoId) async {
    if (videoId.isEmpty) return;
    await _repository.remove(videoId);
    state = state.where((favorite) => favorite.videoId != videoId).toList();
    _pushRemote();
  }

  /// Alterna favorito: si esta lo quita, si no lo agrega.
  ///
  /// Devuelve `true` si la cancion quedo como favorita despues del toggle.
  Future<bool> toggle({
    required String videoId,
    required String title,
    required String author,
    required String thumbnailUrl,
  }) async {
    if (videoId.isEmpty) return false;
    if (isFavorite(videoId)) {
      await remove(videoId);
      return false;
    }
    await add(
      videoId: videoId,
      title: title,
      author: author,
      thumbnailUrl: thumbnailUrl,
    );
    return true;
  }

  void _pushRemote() {
    final sync = ref.read(favoritesSyncProvider);
    ref.read(cloudSyncControllerProvider.notifier).pushOne(sync);
  }
}

import 'package:flow_music/core/sync/syncable.dart';
import 'package:flow_music/features/favorites/data/favorite_song.dart';
import 'package:flow_music/features/favorites/data/favorites_remote_data_source.dart';
import 'package:flow_music/features/favorites/data/favorites_repository.dart';

/// Sincroniza los favoritos locales con la coleccion Firestore del usuario.
///
/// Estrategia de merge: union. Por cada [videoId] se queda con la version
/// que tenga la fecha `addedAt` mas reciente. Esto evita que un dispositivo
/// con datos viejos pise la lista actualizada del usuario.
class FavoritesSync implements Syncable {
  FavoritesSync({
    required this.localRepository,
    required this.remoteDataSource,
  });

  final FavoritesRepository localRepository;
  final FavoritesRemoteDataSource remoteDataSource;

  @override
  String get id => 'favorites';

  @override
  Future<void> pushToRemote(String uid) async {
    final localOwner = localRepository.ownerUid();
    if (localOwner != null && localOwner != uid) return;
    final local = localRepository.readAll();
    await localRepository.markOwner(uid);
    await remoteDataSource.replaceAll(uid, local);
  }

  @override
  Future<void> pullFromRemote(String uid) async {
    final remote = await remoteDataSource.readAll(uid);
    final localOwner = localRepository.ownerUid();
    final localBelongsToAnotherUser = localOwner != null && localOwner != uid;
    if (localBelongsToAnotherUser) {
      if (remote.isEmpty) {
        await localRepository.clearForUser(uid);
      } else {
        await localRepository.replaceAll(remote);
        await localRepository.markOwner(uid);
      }
      return;
    }
    final local = localRepository.readAll();
    final merged = _merge(local, remote);
    await localRepository.replaceAll(merged);
    await localRepository.markOwner(uid);
  }

  List<FavoriteSong> _merge(
    List<FavoriteSong> local,
    List<FavoriteSong> remote,
  ) {
    final map = <String, FavoriteSong>{};
    for (final fav in local) {
      if (fav.videoId.isEmpty) continue;
      map[fav.videoId] = fav;
    }
    for (final fav in remote) {
      if (fav.videoId.isEmpty) continue;
      final existing = map[fav.videoId];
      if (existing == null || fav.addedAt.isAfter(existing.addedAt)) {
        map[fav.videoId] = fav;
      }
    }
    final result = map.values.toList()
      ..sort((a, b) => b.addedAt.compareTo(a.addedAt));
    return result;
  }
}

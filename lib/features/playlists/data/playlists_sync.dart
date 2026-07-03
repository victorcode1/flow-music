import 'package:flow_music/core/sync/syncable.dart';
import 'package:flow_music/features/playlists/data/playlist.dart';
import 'package:flow_music/features/playlists/data/playlists_remote_data_source.dart';
import 'package:flow_music/features/playlists/data/playlists_repository.dart';

/// Sincronizacion de listas de reproduccion. Estrategia de merge: por id,
/// se queda con la version con `updatedAt` mas reciente. Esto preserva la
/// edicion mas nueva sin importar desde que dispositivo se hizo.
class PlaylistsSync implements Syncable {
  PlaylistsSync({
    required this.localRepository,
    required this.remoteDataSource,
  });

  final PlaylistsRepository localRepository;
  final PlaylistsRemoteDataSource remoteDataSource;

  @override
  String get id => 'playlists';

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

  List<Playlist> _merge(List<Playlist> local, List<Playlist> remote) {
    final map = <String, Playlist>{};
    for (final p in local) {
      if (p.id.isEmpty) continue;
      map[p.id] = p;
    }
    for (final p in remote) {
      if (p.id.isEmpty) continue;
      final existing = map[p.id];
      if (existing == null || p.updatedAt.isAfter(existing.updatedAt)) {
        map[p.id] = p;
      }
    }
    final result = map.values.toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return result;
  }
}

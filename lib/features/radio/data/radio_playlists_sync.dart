import 'package:flow_music/core/sync/syncable.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/radio_playlists_remote_data_source.dart';
import 'package:flow_music/features/radio/data/radio_playlists_repository.dart';

class RadioPlaylistsSync implements Syncable {
  RadioPlaylistsSync({
    required this.localRepository,
    required this.remoteDataSource,
  });

  final RadioPlaylistsRepository localRepository;
  final RadioPlaylistsRemoteDataSource remoteDataSource;

  @override
  String get id => 'radioPlaylists';

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

  List<RadioPlaylist> _merge(
    List<RadioPlaylist> local,
    List<RadioPlaylist> remote,
  ) {
    final map = <String, RadioPlaylist>{};
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

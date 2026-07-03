import 'package:flow_music/core/sync/syncable.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_favorites_remote_data_source.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';

/// Sincroniza las emisoras favoritas locales con la coleccion del usuario.
///
/// Estrategia de merge: union por `RadioFavoritesRepository.keyFor`. Para
/// cada estacion repetida se queda con la version que tenga `__favorited_at`
/// mas reciente.
class RadioFavoritesSync implements Syncable {
  RadioFavoritesSync({
    required this.localRepository,
    required this.remoteDataSource,
  });

  final RadioFavoritesRepository localRepository;
  final RadioFavoritesRemoteDataSource remoteDataSource;

  @override
  String get id => 'radioFavorites';

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

  List<RadioStation> _merge(
    List<RadioStation> local,
    List<RadioStation> remote,
  ) {
    final map = <String, RadioStation>{};
    for (final station in local) {
      final key = RadioFavoritesRepository.keyFor(station);
      if (key.isEmpty) continue;
      map[key] = station;
    }
    for (final station in remote) {
      final key = RadioFavoritesRepository.keyFor(station);
      if (key.isEmpty) continue;
      final existing = map[key];
      if (existing == null) {
        map[key] = station;
        continue;
      }
      final newAt =
          RadioFavoritesRepository.favoritedAt(station) ??
          DateTime.fromMillisecondsSinceEpoch(0);
      final oldAt =
          RadioFavoritesRepository.favoritedAt(existing) ??
          DateTime.fromMillisecondsSinceEpoch(0);
      if (newAt.isAfter(oldAt)) {
        map[key] = station;
      }
    }
    return map.values.toList();
  }
}

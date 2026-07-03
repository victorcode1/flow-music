import 'package:flow_music/core/sync/syncable.dart';
import 'package:flow_music/features/settings/data/settings_local_data_source.dart';
import 'package:flow_music/features/settings/data/settings_remote_data_source.dart';
import 'package:flow_music/features/settings/data/user_settings.dart';

/// Sincronizacion de ajustes simples. Estrategia: last-write-wins por
/// `updatedAtMs`. Si el local es mas reciente se empuja; si no, se aplica
/// el remoto sobre el local.
///
/// `onApplied` se invoca cuando la fuente remota gano: los controllers de
/// Riverpod lo usan para refrescar su estado en memoria sin recargar la
/// app.
class SettingsSync implements Syncable {
  SettingsSync({
    required this.localDataSource,
    required this.remoteDataSource,
    this.onApplied,
  });

  final SettingsLocalDataSource localDataSource;
  final SettingsRemoteDataSource remoteDataSource;
  final Future<void> Function(UserSettings settings)? onApplied;

  @override
  String get id => 'settings';

  @override
  Future<void> pushToRemote(String uid) async {
    final local = localDataSource.read();
    if (local.isEmpty) return;
    await localDataSource.markOwner(uid);
    await remoteDataSource.write(uid, local);
  }

  @override
  Future<void> pullFromRemote(String uid) async {
    final remote = await remoteDataSource.read(uid);
    final local = localDataSource.read();
    final localOwner = localDataSource.ownerUid();
    final localBelongsToAnotherUser = localOwner != null && localOwner != uid;

    if (remote == null) {
      // El usuario aun no tiene ajustes en la nube: empuja lo local para
      // sembrar el documento, pero solo si esos ajustes pertenecen a este
      // mismo uid. Si vienen de otra cuenta, se limpian para no contaminar
      // el perfil nuevo.
      if (localBelongsToAnotherUser) {
        await localDataSource.clearForUser(uid);
        return;
      }
      if (!local.isEmpty) await remoteDataSource.write(uid, local);
      await localDataSource.markOwner(uid);
      return;
    }

    if (localBelongsToAnotherUser) {
      await localDataSource.writeForUser(uid, remote);
      final hook = onApplied;
      if (hook != null) await hook(remote);
      return;
    }

    final remoteIsNewer = (remote.updatedAtMs ?? 0) > (local.updatedAtMs ?? 0);
    if (!remoteIsNewer) {
      if (!local.isEmpty) await remoteDataSource.write(uid, local);
      await localDataSource.markOwner(uid);
      return;
    }

    await localDataSource.writeForUser(uid, remote);
    final hook = onApplied;
    if (hook != null) await hook(remote);
  }
}

import 'package:flow_music/core/sync/syncable.dart';
import 'package:flow_music/features/auth/domain/entities/auth_user.dart';
import 'package:flow_music/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flow_music/features/favorites/data/favorites_providers.dart';
import 'package:flow_music/features/playlists/data/playlists_providers.dart';
import 'package:flow_music/features/radio/data/radio_favorites_providers.dart';
import 'package:flow_music/features/radio/data/radio_playlists_providers.dart';
import 'package:flow_music/features/settings/data/settings_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cloud_sync_controller.g.dart';

/// Registro de unidades sincronizables. Para sumar una feature nueva al
/// ciclo (favoritos, playlists, settings, etc.), basta con exponer un
/// provider que devuelva su `Syncable` y agregarlo a esta lista.
@Riverpod(keepAlive: true)
List<Syncable> cloudSyncRegistry(Ref ref) {
  final user = ref.watch(authProvider).asData?.value;
  final settings = ref.watch(settingsSyncProvider);
  // El usuario anonimo es solo local (sin idToken/refreshToken), asi que
  // no puede sincronizar con el servidor. Devolvemos una lista vacia para
  // evitar intentos de pull/push que siempre fallarian con `unauthenticated`.
  if (user == null || user.isAnonymous) return const <Syncable>[];

  return <Syncable>[
    ref.watch(favoritesSyncProvider),
    ref.watch(playlistsSyncProvider),
    ref.watch(radioFavoritesSyncProvider),
    ref.watch(radioPlaylistsSyncProvider),
    settings,
  ];
}

/// Estado de la sincronizacion en la nube.
sealed class CloudSyncState {
  const CloudSyncState();
}

class CloudSyncIdle extends CloudSyncState {
  const CloudSyncIdle();
}

class CloudSyncInProgress extends CloudSyncState {
  const CloudSyncInProgress();
}

class CloudSyncDone extends CloudSyncState {
  const CloudSyncDone(this.completedAt);
  final DateTime completedAt;
}

class CloudSyncError extends CloudSyncState {
  const CloudSyncError(this.message);
  final String message;
}

/// Orquesta el ciclo de sincronizacion. Cuando el usuario inicia sesion,
/// dispara un pull completo (remoto -> local). Tambien expone `pushAll` y
/// `pushOne` para los controllers de feature.
@Riverpod(keepAlive: true)
class CloudSyncController extends _$CloudSyncController {
  String? _lastSyncedUid;

  @override
  CloudSyncState build() {
    ref.listen(authProvider, (previous, next) {
      final user = next.asData?.value;
      if (user == null) {
        _lastSyncedUid = null;
        state = const CloudSyncIdle();
        return;
      }
      if (_lastSyncedUid == user.id) return;
      _lastSyncedUid = user.id;
      // El pull corre en background; el estado se observa via `state`.
      pullAll(user.id);
    });
    return const CloudSyncIdle();
  }

  /// Trae el estado remoto del usuario [uid] y lo aplica a todas las
  /// unidades registradas. Los controllers que dependen de Hive se
  /// suscriben a `state` y refrescan su propia memoria cuando esto emite
  /// [CloudSyncDone].
  Future<void> pullAll(String uid) async {
    final user = ref.read(authProvider).asData?.value;
    if (user == null || user.isAnonymous) {
      state = const CloudSyncIdle();
      return;
    }
    state = const CloudSyncInProgress();
    try {
      final registry = ref.read(cloudSyncRegistryProvider);
      for (final unit in registry) {
        try {
          await unit.pullFromRemote(uid);
        } catch (error, stackTrace) {
          debugPrint('CloudSync pull ${unit.id} failed: $error');
          debugPrintStack(stackTrace: stackTrace);
        }
      }
      state = CloudSyncDone(DateTime.now());
    } catch (error) {
      state = CloudSyncError(error.toString());
    }
  }

  /// Empuja todas las unidades registradas para el usuario [uid].
  Future<void> pushAll(String uid) async {
    final registry = ref.read(cloudSyncRegistryProvider);
    for (final unit in registry) {
      if (!_canSyncUnit(ref.read(authProvider).asData?.value, unit)) continue;
      try {
        await unit.pushToRemote(uid);
      } catch (error, stackTrace) {
        debugPrint('CloudSync push ${unit.id} failed: $error');
        debugPrintStack(stackTrace: stackTrace);
      }
    }
  }

  /// Push best-effort de una sola unidad. Si el usuario no esta autenticado
  /// no hace nada. No relanza errores: la sincronizacion debe ser opaca
  /// para la UI.
  Future<void> pushOne(Syncable unit) async {
    final user = ref.read(authProvider).asData?.value;
    if (!_canSyncUnit(user, unit)) return;
    try {
      await unit.pushToRemote(user!.id);
    } catch (error, stackTrace) {
      debugPrint('CloudSync push ${unit.id} failed: $error');
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}

bool _canSyncUnit(AuthUser? user, Syncable unit) {
  if (user == null) return false;
  return !user.isAnonymous;
}

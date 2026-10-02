import 'package:flow_music/features/account/domain/entities/local_user_data.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';
import 'package:flow_music/features/radio/data/radio_playlists_repository.dart';
import 'package:flow_music/features/settings/data/settings_local_data_source.dart';
import 'package:flow_music/features/settings/data/settings_storage.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

/// Account libraries are archived only in this device's existing Hive box.
class UserDataLocalStore {
  const UserDataLocalStore({
    this.favorites = const RadioFavoritesRepository(),
    this.playlists = const RadioPlaylistsRepository(),
    this.preferences = const SettingsLocalDataSource(),
  });

  // Preserve these keys so an update can still read existing device archives.
  static const _ownerKey = 'user_data_sync_owner_id';
  static const _pendingSwitchKey = 'user_data_local_pending_switch';
  static String _archiveKey(String? userId) =>
      'user_data_local_account_${userId ?? "guest"}';

  final RadioFavoritesRepository favorites;
  final RadioPlaylistsRepository playlists;
  final SettingsLocalDataSource preferences;

  Box get _metadata => Hive.box(settingsBoxName);

  String? get ownerId {
    final value = _metadata.get(_ownerKey);
    return value is String && value.isNotEmpty ? value : null;
  }

  LocalUserData read() => LocalUserData(
    favorites: favorites.readAll(),
    playlists: playlists.readAll(),
    preferences: preferences.read(),
  );

  Future<void> archiveCurrent() =>
      _metadata.put(_archiveKey(ownerId), {'snapshot': read().toJson()});

  Future<bool> switchUser(String? userId) async {
    final recovered = await _recoverPendingSwitch();
    final previous = ownerId;
    if (previous == userId) return recovered;
    final guest = previous == null ? read() : null;
    final archived = _metadata.get(_archiveKey(userId));
    // Decode before changing disk state. Historical cloud fields are ignored.
    final restored = _archivedSnapshot(archived);
    final adoptedGuest = restored == null && guest != null && userId != null;
    final target =
        restored ??
        (adoptedGuest ? guest : null) ??
        const LocalUserData.empty();
    await archiveCurrent();
    // A persisted target makes an interrupted switch recoverable without ever
    // treating a partially written account library as the guest's library.
    await _metadata.put(_pendingSwitchKey, {
      'user_id': userId,
      'snapshot': target.toJson(),
      'adopted_guest': adoptedGuest,
    });
    await _recoverPendingSwitch();
    return true;
  }

  Future<void> deleteAccount(String? userId) async {
    if (userId == null) return;
    await _recoverPendingSwitch();
    if (ownerId == userId) {
      final guest = _archivedSnapshot(_metadata.get(_archiveKey(null)));
      await _metadata.put(_pendingSwitchKey, {
        'user_id': null,
        'snapshot': (guest ?? const LocalUserData.empty()).toJson(),
        'deleted_user_id': userId,
      });
      await _recoverPendingSwitch();
    } else {
      await _metadata.delete(_archiveKey(userId));
    }
  }

  LocalUserData? _archivedSnapshot(Object? archive) =>
      archive is Map && archive['snapshot'] is Map
      ? LocalUserData.fromJson(
          Map<String, dynamic>.from(archive['snapshot'] as Map),
        )
      : null;

  Future<bool> _recoverPendingSwitch() async {
    final pending = _metadata.get(_pendingSwitchKey);
    if (pending is! Map) return false;
    final snapshot = _archivedSnapshot(pending);
    if (snapshot == null) throw StateError('Invalid local account transition');
    final targetUserId = pending['user_id'] as String?;
    await apply(snapshot);
    if (targetUserId == null) {
      await _metadata.delete(_ownerKey);
    } else {
      await _metadata.put(_ownerKey, targetUserId);
    }
    if (pending['adopted_guest'] == true) {
      await _metadata.delete(_archiveKey(null));
    }
    final deletedUserId = pending['deleted_user_id'] as String?;
    if (deletedUserId != null) {
      await _metadata.delete(_archiveKey(deletedUserId));
    }
    await _metadata.delete(_pendingSwitchKey);
    return true;
  }

  Future<void> apply(LocalUserData snapshot) async {
    await favorites.replaceAll(snapshot.favorites);
    await playlists.replaceAll(snapshot.playlists);
    await preferences.clear();
    if (!snapshot.preferences.isEmpty) {
      await preferences.write(snapshot.preferences);
    }
  }
}

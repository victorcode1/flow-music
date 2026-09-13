import 'package:flow_music/features/account/domain/entities/synced_user_data.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';
import 'package:flow_music/features/radio/data/radio_playlists_repository.dart';
import 'package:flow_music/features/settings/data/settings_local_data_source.dart';
import 'package:flow_music/features/settings/data/settings_storage.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

enum SyncedDataSection { favorites, playlists, preferences }

class UserDataLocalStore {
  const UserDataLocalStore({
    this.favorites = const RadioFavoritesRepository(),
    this.playlists = const RadioPlaylistsRepository(),
    this.preferences = const SettingsLocalDataSource(),
  });

  static const _ownerKey = 'user_data_sync_owner_id';
  static const _dirtyPrefix = 'user_data_sync_dirty_';
  static const _baselineKey = 'user_data_sync_has_cloud_baseline';
  static const _lastSuccessKey = 'user_data_sync_last_success';
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

  SyncedUserData read() {
    return SyncedUserData(
      favorites: favorites.readAll(),
      playlists: playlists.readAll(),
      preferences: preferences.read(),
    );
  }

  bool isDirty(SyncedDataSection section) {
    return _metadata.get(_dirtyKey(section)) == true;
  }

  Future<void> markDirty(SyncedDataSection section) {
    return _metadata.put(_dirtyKey(section), true);
  }

  Future<void> clearDirty(SyncedDataSection section) {
    return _metadata.delete(_dirtyKey(section));
  }

  Future<void> clearAllDirty() async {
    for (final section in SyncedDataSection.values) {
      await clearDirty(section);
    }
  }

  Future<void> setOwner(String userId) => _metadata.put(_ownerKey, userId);

  bool get hasCloudBaseline => _metadata.get(_baselineKey) == true;

  DateTime? get lastSuccessfulSync =>
      DateTime.tryParse(_metadata.get(_lastSuccessKey) as String? ?? '');

  Future<void> recordSuccessfulSync(DateTime at) =>
      _metadata.put(_lastSuccessKey, at.toUtc().toIso8601String());

  Future<void> setCloudBaseline() => _metadata.put(_baselineKey, true);

  Future<void> archiveCurrent() => _metadata.put(_archiveKey(ownerId), {
    'snapshot': read().toDatabase(userId: ownerId ?? ''),
    'dirty': [
      for (final section in SyncedDataSection.values)
        if (isDirty(section)) section.name,
    ],
    'baseline': hasCloudBaseline,
    'last_success': lastSuccessfulSync?.toUtc().toIso8601String(),
  });

  Future<bool> switchUser(String? userId) async {
    final previous = ownerId;
    if (previous == userId) return false;
    final guest = previous == null ? read() : null;
    await archiveCurrent();
    final archived = _metadata.get(_archiveKey(userId));
    await clearUserData();
    if (archived is Map && archived['snapshot'] is Map) {
      await apply(
        SyncedUserData.fromDatabase(
          Map<String, dynamic>.from(archived['snapshot'] as Map),
        ),
      );
      for (final section in SyncedDataSection.values) {
        if ((archived['dirty'] as List?)?.contains(section.name) ?? false) {
          await markDirty(section);
        }
      }
      if (archived['baseline'] == true) await setCloudBaseline();
      final lastSuccess = DateTime.tryParse(
        archived['last_success'] as String? ?? '',
      );
      if (lastSuccess != null) await recordSuccessfulSync(lastSuccess);
    } else if (guest != null && userId != null) {
      // First account may adopt guest data, but a second account never inherits
      // the first account's library.
      await apply(guest);
    }
    if (userId != null) {
      await setOwner(userId);
      if (guest != null && archived is! Map) {
        await _metadata.delete(_archiveKey(null));
      }
    }
    return true;
  }

  Future<void> deleteAccount(String? userId) async {
    if (userId == null) return;
    await _metadata.delete(_archiveKey(userId));
    if (ownerId == userId) await clearUserData();
  }

  Future<void> apply(SyncedUserData snapshot) async {
    await favorites.replaceAll(snapshot.favorites);
    await playlists.replaceAll(snapshot.playlists);
    await preferences.clear();
    if (!snapshot.preferences.isEmpty) {
      await preferences.write(snapshot.preferences);
    }
  }

  Future<void> clearUserData() async {
    await favorites.replaceAll(const []);
    await playlists.replaceAll(const []);
    await preferences.clear();
    await _metadata.delete(_ownerKey);
    await _metadata.delete(_baselineKey);
    await _metadata.delete(_lastSuccessKey);
    await clearAllDirty();
  }

  String _dirtyKey(SyncedDataSection section) => '$_dirtyPrefix${section.name}';
}

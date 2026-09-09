import 'package:flow_music/features/account/domain/entities/synced_user_data.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/settings/data/user_settings.dart';

abstract interface class UserDataSyncRepository {
  bool get isAvailable;

  Future<SyncedUserData?> fetch(String userId);

  Future<void> saveSnapshot(String userId, SyncedUserData snapshot);

  Future<void> saveFavorites(String userId, List<RadioStation> favorites);

  Future<void> savePlaylists(String userId, List<RadioPlaylist> playlists);

  Future<void> savePreferences(String userId, UserSettings preferences);
}

class NoopUserDataSyncRepository implements UserDataSyncRepository {
  const NoopUserDataSyncRepository();

  @override
  bool get isAvailable => false;

  @override
  Future<SyncedUserData?> fetch(String userId) async => null;

  @override
  Future<void> saveFavorites(
    String userId,
    List<RadioStation> favorites,
  ) async {}

  @override
  Future<void> savePlaylists(
    String userId,
    List<RadioPlaylist> playlists,
  ) async {}

  @override
  Future<void> savePreferences(String userId, UserSettings preferences) async {}

  @override
  Future<void> saveSnapshot(String userId, SyncedUserData snapshot) async {}
}

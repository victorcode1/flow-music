import 'package:flow_music/features/account/data/cloud_library_api.dart';
import 'package:flow_music/features/account/domain/entities/synced_user_data.dart';
import 'package:flow_music/features/account/domain/repositories/user_data_sync_repository.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/settings/data/user_settings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserDataSyncRepository implements UserDataSyncRepository {
  const SupabaseUserDataSyncRepository(this._client);
  final SupabaseClient _client;
  CloudLibraryApi _api(String userId) =>
      CloudLibraryApi(_client, expectedUserId: userId);
  @override
  bool get isAvailable => true;
  @override
  Future<SyncedUserData?> fetch(String userId) async {
    final data = await _api(userId).call('read');
    final row = data['snapshot'];
    return row is Map
        ? SyncedUserData.fromDatabase(Map<String, dynamic>.from(row))
        : null;
  }

  @override
  Future<void> saveSnapshot(String userId, SyncedUserData snapshot) async {
    await _api(userId).call('write', {
      'favorites': snapshot.favorites.map((x) => x.toJson()).toList(),
      'playlists': snapshot.playlists.map((x) => x.toJson()).toList(),
      'preferences': snapshot.preferences.toJson(),
    });
  }

  @override
  Future<void> saveFavorites(
    String userId,
    List<RadioStation> favorites,
  ) async {
    await _api(
      userId,
    ).call('write', {'favorites': favorites.map((x) => x.toJson()).toList()});
  }

  @override
  Future<void> savePlaylists(
    String userId,
    List<RadioPlaylist> playlists,
  ) async {
    await _api(
      userId,
    ).call('write', {'playlists': playlists.map((x) => x.toJson()).toList()});
  }

  @override
  Future<void> savePreferences(String userId, UserSettings preferences) async {
    await _api(userId).call('write', {'preferences': preferences.toJson()});
  }
}

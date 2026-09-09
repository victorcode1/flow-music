import 'package:flow_music/features/account/domain/entities/synced_user_data.dart';
import 'package:flow_music/features/account/domain/repositories/user_data_sync_repository.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/settings/data/user_settings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserDataSyncRepository implements UserDataSyncRepository {
  const SupabaseUserDataSyncRepository(this._client);

  static const _table = 'user_data_sync';

  final SupabaseClient _client;

  @override
  bool get isAvailable => true;

  @override
  Future<SyncedUserData?> fetch(String userId) async {
    final row = await _client
        .from(_table)
        .select('favorites, playlists, preferences')
        .eq('user_id', userId)
        .maybeSingle();
    return row == null ? null : SyncedUserData.fromDatabase(row);
  }

  @override
  Future<void> saveSnapshot(String userId, SyncedUserData snapshot) {
    return _client
        .from(_table)
        .upsert(snapshot.toDatabase(userId: userId), onConflict: 'user_id');
  }

  @override
  Future<void> saveFavorites(String userId, List<RadioStation> favorites) {
    final now = DateTime.now().toUtc().toIso8601String();
    return _client
        .from(_table)
        .upsert(
          {
            'user_id': userId,
            'favorites': favorites.map((station) => station.toJson()).toList(),
            'favorites_updated_at': now,
            'updated_at': now,
          },
          onConflict: 'user_id',
          defaultToNull: false,
        );
  }

  @override
  Future<void> savePlaylists(String userId, List<RadioPlaylist> playlists) {
    final now = DateTime.now().toUtc().toIso8601String();
    return _client
        .from(_table)
        .upsert(
          {
            'user_id': userId,
            'playlists': playlists
                .map((playlist) => playlist.toJson())
                .toList(),
            'playlists_updated_at': now,
            'updated_at': now,
          },
          onConflict: 'user_id',
          defaultToNull: false,
        );
  }

  @override
  Future<void> savePreferences(String userId, UserSettings preferences) {
    final now = DateTime.now().toUtc().toIso8601String();
    return _client
        .from(_table)
        .upsert(
          {
            'user_id': userId,
            'preferences': preferences.toJson(),
            'preferences_updated_at': now,
            'updated_at': now,
          },
          onConflict: 'user_id',
          defaultToNull: false,
        );
  }
}

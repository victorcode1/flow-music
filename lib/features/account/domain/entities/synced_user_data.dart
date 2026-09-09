import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';
import 'package:flow_music/features/settings/data/user_settings.dart';

class SyncedUserData {
  const SyncedUserData({
    required this.favorites,
    required this.playlists,
    required this.preferences,
  });

  const SyncedUserData.empty()
    : favorites = const [],
      playlists = const [],
      preferences = const UserSettings();

  factory SyncedUserData.fromDatabase(Map<String, dynamic> row) {
    return SyncedUserData(
      favorites: _decodeFavorites(row['favorites']),
      playlists: _decodePlaylists(row['playlists']),
      preferences: UserSettings.fromJson(_jsonObject(row['preferences'])),
    );
  }

  final List<RadioStation> favorites;
  final List<RadioPlaylist> playlists;
  final UserSettings preferences;

  Map<String, dynamic> toDatabase({required String userId}) {
    final now = DateTime.now().toUtc().toIso8601String();
    return {
      'user_id': userId,
      'favorites': favorites.map((station) => station.toJson()).toList(),
      'playlists': playlists.map((playlist) => playlist.toJson()).toList(),
      'preferences': preferences.toJson(),
      'favorites_updated_at': now,
      'playlists_updated_at': now,
      'preferences_updated_at': now,
      'updated_at': now,
    };
  }

  static SyncedUserData mergeGuestData({
    required SyncedUserData remote,
    required SyncedUserData local,
  }) {
    final favorites = <String, RadioStation>{};
    for (final station in [...remote.favorites, ...local.favorites]) {
      final key = RadioFavoritesRepository.keyFor(station);
      if (key.isEmpty) continue;
      final current = favorites[key];
      if (current == null ||
          _favoriteTimestamp(station).isAfter(_favoriteTimestamp(current))) {
        favorites[key] = station;
      }
    }

    final playlists = <String, RadioPlaylist>{};
    for (final playlist in [...remote.playlists, ...local.playlists]) {
      if (playlist.id.isEmpty) continue;
      final current = playlists[playlist.id];
      if (current == null || playlist.updatedAt.isAfter(current.updatedAt)) {
        playlists[playlist.id] = playlist;
      }
    }

    final localSettingsAt = local.preferences.updatedAtMs ?? 0;
    final remoteSettingsAt = remote.preferences.updatedAtMs ?? 0;
    final preferences = localSettingsAt > remoteSettingsAt
        ? local.preferences
        : remote.preferences;

    final favoriteList = favorites.values.toList()
      ..sort((a, b) => _favoriteTimestamp(b).compareTo(_favoriteTimestamp(a)));
    final playlistList = playlists.values.toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    return SyncedUserData(
      favorites: favoriteList,
      playlists: playlistList,
      preferences: preferences,
    );
  }
}

List<RadioStation> _decodeFavorites(Object? raw) {
  if (raw is! List) return const [];
  final favorites = <RadioStation>[];
  for (final item in raw.whereType<Map>()) {
    final station = RadioStation.fromJson(Map<String, dynamic>.from(item));
    if (RadioFavoritesRepository.keyFor(station).isNotEmpty) {
      favorites.add(station);
    }
  }
  return favorites;
}

List<RadioPlaylist> _decodePlaylists(Object? raw) {
  if (raw is! List) return const [];
  final playlists = <RadioPlaylist>[];
  for (final item in raw.whereType<Map>()) {
    final playlist = RadioPlaylist.fromJson(Map<String, dynamic>.from(item));
    if (playlist.id.isNotEmpty) playlists.add(playlist);
  }
  return playlists;
}

Map<String, dynamic> _jsonObject(Object? raw) {
  return raw is Map ? Map<String, dynamic>.from(raw) : const {};
}

DateTime _favoriteTimestamp(RadioStation station) {
  return RadioFavoritesRepository.favoritedAt(station) ??
      DateTime.fromMillisecondsSinceEpoch(0);
}

import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';
import 'package:flow_music/features/settings/data/user_settings.dart';

class LocalUserData {
  const LocalUserData({
    required this.favorites,
    required this.playlists,
    required this.preferences,
  });

  const LocalUserData.empty()
    : favorites = const [],
      playlists = const [],
      preferences = const UserSettings();

  factory LocalUserData.fromJson(Map<String, dynamic> row) {
    return LocalUserData(
      favorites: _decodeFavorites(row['favorites']),
      playlists: _decodePlaylists(row['playlists']),
      preferences: UserSettings.fromJson(_jsonObject(row['preferences'])),
    );
  }

  final List<RadioStation> favorites;
  final List<RadioPlaylist> playlists;
  final UserSettings preferences;

  Map<String, dynamic> toJson() {
    return {
      'favorites': favorites.map((station) => station.toJson()).toList(),
      'playlists': playlists.map((playlist) => playlist.toJson()).toList(),
      'preferences': preferences.toJson(),
    };
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

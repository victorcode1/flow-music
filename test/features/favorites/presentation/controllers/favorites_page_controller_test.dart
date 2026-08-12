import 'package:flow_music/features/favorites/presentation/controllers/favorites_page_controller.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const controller = FavoritesPageController();

  test('filters stations without case, accents or punctuation', () {
    final stations = [
      RadioStation.fromJson(const {
        'stationuuid': 'maxima',
        'name': 'MÁXIMA-FM 102.5',
        'country': 'España',
        'url_resolved': 'https://radio.example/maxima',
      }),
      RadioStation.fromJson(const {
        'stationuuid': 'other',
        'name': 'Otra Radio',
        'url_resolved': 'https://radio.example/other',
      }),
    ];

    final result = controller.filterStations(stations, 'maxima fm 102 5');

    expect(result.map((station) => station.stationUuid), ['maxima']);
  });

  test('filters playlist names with the same normalization', () {
    final now = DateTime.utc(2026, 8, 12);
    final playlists = [
      RadioPlaylist(
        id: 'spanish',
        name: 'Música-Española',
        createdAt: now,
        updatedAt: now,
        items: const [],
      ),
    ];

    expect(controller.filterPlaylists(playlists, 'MUSICA ESPANOLA'), playlists);
  });
}

import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('builds a playable station from a Radio Browser response', () {
    final station = RadioStation.fromJson({
      'stationuuid': 'station-1',
      'name': 'Radio Example',
      'url_resolved': 'https://radio.example/stream',
      'country': 'Panama',
      'countrycode': 'PA',
    });

    expect(station.name, 'Radio Example');
    expect(station.isPlayable, isTrue);
    expect(station.countryCode, 'PA');
  });
}

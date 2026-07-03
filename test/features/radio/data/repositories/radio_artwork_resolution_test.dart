import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/repositories/radio_browser_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('RadioStation.artworkUrl', () {
    test('returns empty string for non-http artwork', () {
      final station = _buildStation(favicon: 'ftp://example.com/logo.png');

      expect(station.artworkUrl, isEmpty);
    });

    test('returns normalized url for valid http artwork', () {
      final station = _buildStation(favicon: ' https://example.com/logo.png ');

      expect(station.artworkUrl, 'https://example.com/logo.png');
    });
  });

  group('RadioBrowserRepository.resolveArtworkUrl', () {
    test('returns null when artwork responds with 404', () async {
      final repository = RadioBrowserRepository(
        client: MockClient((request) async {
          expect(request.method, 'HEAD');
          return http.Response('', 404);
        }),
      );

      final result = await repository.resolveArtworkUrl(
        _buildStation(favicon: 'https://example.com/logo.png'),
      );

      expect(result, isNull);
    });

    test('returns artwork url when artwork responds with success', () async {
      final repository = RadioBrowserRepository(
        client: MockClient((request) async {
          expect(request.method, 'HEAD');
          return http.Response('', 200);
        }),
      );

      final result = await repository.resolveArtworkUrl(
        _buildStation(favicon: 'https://example.com/logo.png'),
      );

      expect(result, 'https://example.com/logo.png');
    });
  });
}

RadioStation _buildStation({required String favicon}) {
  return RadioStation(
    stationUuid: 'station-1',
    name: 'Antena 8',
    url: 'https://stream.example.com/live',
    urlResolved: 'https://stream.example.com/live',
    homepage: 'https://example.com',
    favicon: favicon,
    tags: 'news',
    country: 'Panama',
    countryCode: 'PA',
    language: 'es',
    codec: 'AAC+',
    bitrate: 128,
    votes: 10,
    clickCount: 20,
    lastCheckOk: 1,
    latitude: null,
    longitude: null,
    rawData: const {},
  );
}

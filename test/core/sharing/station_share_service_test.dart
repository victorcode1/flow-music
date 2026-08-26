import 'package:flow_music/core/sharing/station_share_service.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('builds a stable HTTPS handoff link for a station', () {
    final url = StationShareService.buildShareUrl(
      _station('3f9b44a0-fafd-4ff4-a4fb-6ea83a4fc85a'),
    );

    expect(
      url.toString(),
      'https://victorcode1.github.io/flow-music/share?station=3f9b44a0-fafd-4ff4-a4fb-6ea83a4fc85a',
    );
  });

  test('does not build a handoff link without a station UUID', () {
    expect(StationShareService.buildShareUrl(_station('')), isNull);
  });
}

RadioStation _station(String uuid) {
  return RadioStation(
    stationUuid: uuid,
    name: 'Radio Test',
    url: 'https://example.com/live',
    urlResolved: '',
    homepage: '',
    favicon: '',
    tags: '',
    country: 'Panama',
    countryCode: 'PA',
    language: 'Spanish',
    codec: 'MP3',
    bitrate: 128,
    votes: 1,
    clickCount: 1,
    lastCheckOk: 1,
    latitude: null,
    longitude: null,
    rawData: const {},
  );
}

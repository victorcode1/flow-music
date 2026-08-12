import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses Radio Browser reliability metadata', () {
    final station = RadioStation.fromJson(const {
      'stationuuid': 'station-1',
      'name': 'Reliable Radio',
      'url_resolved': 'https://radio.example/live.m3u8',
      'bitrate': '128',
      'lastcheckok': '1',
      'lastchecktime_iso8601': '2026-08-10T10:00:00Z',
      'lastcheckoktime_iso8601': '2026-08-10T09:59:00Z',
      'hls': '1',
      'ssl_error': 0,
    });

    expect(station.isPlayable, isTrue);
    expect(station.isHttps, isTrue);
    expect(station.isHls, isTrue);
    expect(station.hasSslError, isFalse);
    expect(station.bitrate, 128);
    expect(station.lastCheckOk, 1);
    expect(station.lastCheckTime, DateTime.utc(2026, 8, 10, 10));
    expect(station.lastCheckOkTime, DateTime.utc(2026, 8, 10, 9, 59));
  });

  test('rejects malformed and unsupported stream URLs', () {
    final malformed = RadioStation.fromJson(const {
      'name': 'Malformed',
      'url_resolved': 'not a stream',
    });
    final unsupported = RadioStation.fromJson(const {
      'name': 'Unsupported',
      'url_resolved': 'ftp://radio.example/live',
    });

    expect(malformed.isPlayable, isFalse);
    expect(unsupported.isPlayable, isFalse);
    expect(RadioStation.isPlayableUrl('http://radio.example/live'), isTrue);
  });
}

import 'dart:io';

import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_station_health_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';

void main() {
  late Directory tempDirectory;
  late Box box;
  var now = DateTime.utc(2026, 8, 12, 12);

  setUpAll(() async {
    tempDirectory = Directory.systemTemp.createTempSync(
      'streambeat-radio-health-test-',
    );
    Hive.init(tempDirectory.path);
    box = await Hive.openBox(radioStationHealthBoxName);
  });

  setUp(() async {
    now = DateTime.utc(2026, 8, 12, 12);
    await box.clear();
  });

  tearDownAll(() async {
    await box.close();
    await tempDirectory.delete(recursive: true);
  });

  test('suppresses a station after two recent failures', () async {
    final repository = RadioStationHealthRepository(now: () => now);
    final station = _station('station-1');

    await repository.recordFailure(station, StateError('first'));
    expect(repository.isTemporarilySuppressed(station), isFalse);

    await repository.recordFailure(station, StateError('second'));
    expect(repository.isTemporarilySuppressed(station), isTrue);

    now = now.add(const Duration(hours: 13));
    expect(repository.isTemporarilySuppressed(station), isFalse);
  });

  test('a successful playback resets consecutive failures', () async {
    final repository = RadioStationHealthRepository(now: () => now);
    final station = _station('station-1');

    await repository.recordFailure(station);
    await repository.recordFailure(station);
    await repository.recordSuccess(station);

    final health = repository.read(station);
    expect(health.consecutiveFailures, 0);
    expect(health.lastSuccess, now);
    expect(repository.isTemporarilySuppressed(station), isFalse);
  });

  test(
    'ranks a recent local success before a repeatedly failing station',
    () async {
      final repository = RadioStationHealthRepository(now: () => now);
      final successful = _station('successful', https: false);
      final failing = _station('failing');
      await repository.recordSuccess(successful);
      await repository.recordFailure(failing);
      await repository.recordFailure(failing);

      final ranked = repository.rank([failing, successful]);

      expect(ranked.map((station) => station.stationUuid), [
        'successful',
        'failing',
      ]);
    },
  );
}

RadioStation _station(String id, {bool https = true}) {
  return RadioStation.fromJson({
    'stationuuid': id,
    'name': id,
    'url_resolved': '${https ? 'https' : 'http'}://radio.example/$id',
    'lastcheckok': 1,
    'lastcheckoktime_iso8601': '2026-08-11T12:00:00Z',
    'clickcount': 100,
  });
}

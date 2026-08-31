import 'dart:io';

import 'package:flow_music/features/flow_mix/data/flow_mix_feedback_repository.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';

void main() {
  late Directory tempDirectory;
  late Box box;
  var now = DateTime.utc(2026, 8, 30, 12);

  setUpAll(() async {
    tempDirectory = Directory.systemTemp.createTempSync(
      'streambeat-flow-mix-feedback-test-',
    );
    Hive.init(tempDirectory.path);
    box = await Hive.openBox(flowMixFeedbackBoxName);
  });

  setUp(() async {
    now = DateTime.utc(2026, 8, 30, 12);
    await box.clear();
  });

  tearDownAll(() async {
    await box.close();
    await tempDirectory.delete(recursive: true);
  });

  test('persists station and tag feedback locally', () async {
    final repository = FlowMixFeedbackRepository(now: () => now);
    await repository.recordLessLikeThis(_station('rock-one', 'rock,dance'));

    final profile = repository.readProfile();

    expect(profile.dismissedStationIds, contains('rock-one'));
    expect(profile.negativeTagCounts['rock'], 1);
    expect(profile.negativeTagCounts['dance'], 1);
  });

  test('tag influence expires before the station dismissal', () async {
    final repository = FlowMixFeedbackRepository(now: () => now);
    await repository.recordLessLikeThis(_station('rock-one', 'rock'));

    now = now.add(const Duration(days: 31));
    final profile = repository.readProfile();

    expect(profile.dismissedStationIds, contains('rock-one'));
    expect(profile.negativeTagCounts, isEmpty);
  });

  test('dismissal expires after ninety days', () async {
    final repository = FlowMixFeedbackRepository(now: () => now);
    await repository.recordLessLikeThis(_station('rock-one', 'rock'));

    now = now.add(const Duration(days: 91));

    expect(repository.readProfile().dismissedStationIds, isEmpty);
  });
}

RadioStation _station(String id, String tags) {
  return RadioStation.fromJson({
    'stationuuid': id,
    'name': id,
    'url_resolved': 'https://radio.example/$id',
    'tags': tags,
  });
}

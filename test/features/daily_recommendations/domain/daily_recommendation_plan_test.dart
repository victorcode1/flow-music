import 'dart:math';

import 'package:flow_music/features/daily_recommendations/domain/daily_recommendation_plan.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('schedules one recommendation per day at 18:00', () {
    final plan = buildDailyRecommendationPlan(
      stations: [_station('one'), _station('two')],
      now: DateTime(2026, 8, 24, 12),
      days: 3,
      random: Random(7),
    );

    expect(plan, hasLength(3));
    expect(plan[0].scheduledAt, DateTime(2026, 8, 24, 18));
    expect(plan[1].scheduledAt, DateTime(2026, 8, 25, 18));
    expect(plan[2].scheduledAt, DateTime(2026, 8, 26, 18));
  });

  test('starts the next day when today schedule already passed', () {
    final plan = buildDailyRecommendationPlan(
      stations: [_station('one')],
      now: DateTime(2026, 8, 24, 18, 1),
      days: 1,
      random: Random(1),
    );

    expect(plan.single.scheduledAt, DateTime(2026, 8, 25, 18));
  });

  test('uses every candidate before repeating one', () {
    final plan = buildDailyRecommendationPlan(
      stations: [_station('one'), _station('two'), _station('three')],
      now: DateTime(2026, 8, 24, 8),
      days: 7,
      random: Random(3),
    );

    expect(
      plan.take(3).map((slot) => slot.station.stationUuid).toSet(),
      hasLength(3),
    );
    for (var index = 1; index < plan.length; index++) {
      expect(
        plan[index].station.stationUuid,
        isNot(plan[index - 1].station.stationUuid),
      );
    }
  });

  test('ignores duplicates and unplayable stations', () {
    final duplicate = _station('one');
    final plan = buildDailyRecommendationPlan(
      stations: [
        duplicate,
        duplicate,
        _station('broken', url: 'file:///tmp/radio'),
      ],
      now: DateTime(2026, 8, 24, 8),
      days: 2,
      random: Random(1),
    );

    expect(plan.map((slot) => slot.station.stationUuid), everyElement('one'));
  });
}

RadioStation _station(String id, {String? url}) {
  final streamUrl = url ?? 'https://example.com/$id';
  return RadioStation.fromJson({
    'stationuuid': id,
    'name': 'Station $id',
    'url': streamUrl,
    'url_resolved': streamUrl,
    'country': 'Panama',
  });
}

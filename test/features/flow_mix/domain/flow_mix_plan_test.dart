import 'dart:math';

import 'package:flow_music/features/flow_mix/domain/flow_mix_feedback.dart';
import 'package:flow_music/features/flow_mix/domain/flow_mix_mood.dart';
import 'package:flow_music/features/flow_mix/domain/flow_mix_plan.dart';
import 'package:flow_music/features/history/data/playback_history_entry.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime(2026, 8, 30, 20);

  test(
    'creates a unique 15-station queue without recent or dismissed items',
    () {
      final candidates = List.generate(
        20,
        (index) => _station(
          'station-$index',
          tags: index.isEven ? 'rock,dance' : 'jazz,ambient',
          countryCode: index % 3 == 0 ? 'PA' : 'US',
        ),
      );
      final queue = buildFlowMixQueue(
        candidates: candidates,
        mood: FlowMixMood.surprise,
        favorites: const [],
        history: [_history('station-0', now.subtract(const Duration(days: 2)))],
        feedback: const FlowMixFeedbackProfile(
          dismissedStationIds: {'station-1'},
        ),
        now: now,
        random: Random(4),
      );

      expect(queue, hasLength(15));
      expect(queue.map(flowMixStationId).toSet(), hasLength(15));
      expect(queue.map(flowMixStationId), isNot(contains('station-0')));
      expect(queue.map(flowMixStationId), isNot(contains('station-1')));
    },
  );

  test('prioritizes stations that match the selected mood', () {
    final queue = buildFlowMixQueue(
      candidates: [
        _station('energetic', tags: 'rock,dance'),
        _station('calm', tags: 'ambient,chillout'),
      ],
      mood: FlowMixMood.relax,
      favorites: const [],
      history: const [],
      feedback: const FlowMixFeedbackProfile(),
      now: now,
      random: Random(1),
      limit: 1,
    );

    expect(flowMixStationId(queue.single), 'calm');
  });

  test('strongly prioritizes the resolved country for local mixes', () {
    final queue = buildFlowMixQueue(
      candidates: [
        _station('global', tags: 'pop', countryCode: 'US'),
        _station('local', tags: 'jazz', countryCode: 'PA'),
      ],
      mood: FlowMixMood.local,
      favorites: const [],
      history: const [],
      feedback: const FlowMixFeedbackProfile(),
      countryCode: 'pa',
      now: now,
      random: Random(2),
      limit: 1,
    );

    expect(flowMixStationId(queue.single), 'local');
  });

  test('negative tag feedback reduces similar recommendations', () {
    final queue = buildFlowMixQueue(
      candidates: [
        _station('more-rock', tags: 'rock'),
        _station('different', tags: 'pop'),
      ],
      mood: FlowMixMood.energy,
      favorites: const [],
      history: const [],
      feedback: const FlowMixFeedbackProfile(negativeTagCounts: {'rock': 4}),
      now: now,
      random: Random(3),
      limit: 1,
    );

    expect(flowMixStationId(queue.single), 'different');
  });

  test('does not reuse recent stations just to fill the queue', () {
    final recent = _station('recent', tags: 'rock');
    final queue = buildFlowMixQueue(
      candidates: [recent],
      mood: FlowMixMood.energy,
      favorites: const [],
      history: [_history('recent', now.subtract(const Duration(days: 1)))],
      feedback: const FlowMixFeedbackProfile(),
      now: now,
      random: Random(5),
      limit: 15,
    );

    expect(queue, isEmpty);
  });

  test('normalizes common chill and lo-fi tag variants', () {
    expect(flowMixStationTags(_station('chill', tags: 'chill out')), {
      'chillout',
    });
    expect(flowMixStationTags(_station('lofi', tags: 'lo-fi')), {'lofi'});
  });
}

PlaybackHistoryEntry _history(String id, DateTime playedAt) {
  return PlaybackHistoryEntry(
    id: id,
    title: id,
    subtitle: '',
    thumbnailUrl: '',
    playedAt: playedAt,
    playCount: 1,
    kind: PlaybackHistoryKind.radio,
  );
}

RadioStation _station(
  String id, {
  required String tags,
  String countryCode = 'US',
}) {
  return RadioStation.fromJson({
    'stationuuid': id,
    'name': 'Station $id',
    'url_resolved': 'https://radio.example/$id',
    'tags': tags,
    'country': countryCode == 'PA' ? 'Panama' : 'United States',
    'countrycode': countryCode,
    'lastcheckok': 1,
    'bitrate': 128,
    'clickcount': 100,
    'votes': 10,
  });
}

import 'dart:io';

import 'package:flow_music/features/flow_mix/data/flow_mix_catalog_repository.dart';
import 'package:flow_music/features/flow_mix/data/flow_mix_feedback_repository.dart';
import 'package:flow_music/features/flow_mix/domain/flow_mix_mood.dart';
import 'package:flow_music/features/flow_mix/presentation/controllers/flow_mix_controller.dart';
import 'package:flow_music/features/history/data/playback_history_repository.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_queue_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  late Directory tempDirectory;
  late List<Box> boxes;

  setUpAll(() async {
    tempDirectory = Directory.systemTemp.createTempSync(
      'streambeat-flow-mix-controller-test-',
    );
    Hive.init(tempDirectory.path);
    boxes = [
      await Hive.openBox(playbackHistoryBoxName),
      await Hive.openBox(radioFavoritesBoxName),
      await Hive.openBox(flowMixFeedbackBoxName),
    ];
  });

  setUp(() async {
    for (final box in boxes) {
      await box.clear();
    }
  });

  tearDownAll(() async {
    for (final box in boxes) {
      await box.close();
    }
    await tempDirectory.delete(recursive: true);
  });

  test('builds and enqueues a ready Flow Mix session', () async {
    final stations = List.generate(20, (index) => _station('station-$index'));
    final container = ProviderContainer(
      overrides: [
        flowMixCatalogRepositoryProvider.overrideWithValue(
          _FakeFlowMixCatalog(stations),
        ),
      ],
    );
    addTearDown(container.dispose);

    final first = await container
        .read(flowMixControllerProvider.notifier)
        .start(mood: FlowMixMood.energy, countryCode: 'PA');

    final state = container.read(flowMixControllerProvider);
    final queue = container.read(radioQueueControllerProvider);
    expect(first, isNotNull);
    expect(state.status, FlowMixStatus.ready);
    expect(state.stations, hasLength(15));
    expect(queue.stations, hasLength(15));
    expect(queue.current, same(first));
  });

  test('less-like-this feedback is available to the next session', () async {
    final station = _station('station-1');
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await container
        .read(flowMixControllerProvider.notifier)
        .lessLikeThis(station);

    final profile = container
        .read(flowMixFeedbackRepositoryProvider)
        .readProfile();
    expect(profile.dismissedStationIds, contains('station-1'));
  });
}

class _FakeFlowMixCatalog extends FlowMixCatalogRepository {
  _FakeFlowMixCatalog(this.stations);

  final List<RadioStation> stations;

  @override
  Future<List<RadioStation>> loadCandidates({
    required FlowMixMood mood,
    required Iterable<RadioStation> favorites,
    required Set<String> preferredTags,
    String countryCode = '',
  }) async {
    return stations;
  }
}

RadioStation _station(String id) {
  return RadioStation.fromJson({
    'stationuuid': id,
    'name': id,
    'url_resolved': 'https://radio.example/$id',
    'tags': 'rock,dance',
    'country': 'Panama',
    'countrycode': 'PA',
    'lastcheckok': 1,
    'bitrate': 128,
  });
}

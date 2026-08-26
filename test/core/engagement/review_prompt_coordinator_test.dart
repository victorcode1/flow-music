import 'package:flow_music/core/analytics/product_analytics.dart';
import 'package:flow_music/core/engagement/review_prompt_coordinator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late _MemoryStore store;
  late _ReviewGateway gateway;
  late _RecordingSink sink;
  late DateTime now;
  late ReviewPromptCoordinator coordinator;

  setUp(() {
    store = _MemoryStore();
    gateway = _ReviewGateway();
    sink = _RecordingSink();
    now = DateTime.utc(2026, 8, 20);
    coordinator = ReviewPromptCoordinator(
      store: store,
      gateway: gateway,
      analytics: ProductAnalytics(
        sink: sink,
        anonymousId: '10000000-0000-4000-8000-000000000001',
        sessionId: '20000000-0000-4000-8000-000000000002',
        platform: 'android',
        appVersion: '1.1.3+6',
        localeProvider: () => 'es-PA',
      ),
      now: () => now,
    );
  });

  test('does not request a review before enough successful plays', () async {
    await coordinator.initialize();
    now = now.add(const Duration(days: 3));
    await coordinator.recordSuccessfulPlay(
      stationId: 'station-1',
      countryCode: 'PA',
      source: 'selection',
    );
    await coordinator.considerReviewAfterPositiveMoment('favorite_added');

    expect(gateway.requestCount, 0);
  });

  test('requests once after app age, plays, and a positive moment', () async {
    await coordinator.initialize();
    for (var index = 0; index < 3; index++) {
      await coordinator.recordSuccessfulPlay(
        stationId: 'station-$index',
        countryCode: 'PA',
        source: 'selection',
      );
    }
    now = now.add(const Duration(days: 2));

    await coordinator.considerReviewAfterPositiveMoment('favorite_added');
    await coordinator.considerReviewAfterPositiveMoment('playlist_created');

    expect(gateway.requestCount, 1);
    expect(
      sink.events.map((event) => event['event_name']),
      containsAll(['activation_completed', 'review_requested']),
    );
  });

  test(
    'does not mark a request when the native review flow is unavailable',
    () async {
      gateway.available = false;
      await coordinator.initialize();
      for (var index = 0; index < 3; index++) {
        await coordinator.recordSuccessfulPlay(
          stationId: 'station-$index',
          countryCode: '',
          source: 'queue',
        );
      }
      now = now.add(const Duration(days: 2));
      await coordinator.considerReviewAfterPositiveMoment('favorite_added');
      gateway.available = true;
      await coordinator.considerReviewAfterPositiveMoment('playlist_created');

      expect(gateway.requestCount, 1);
    },
  );
}

class _MemoryStore implements EngagementStore {
  final Map<String, Object> values = {};

  @override
  bool readBool(String key) => values[key] as bool? ?? false;

  @override
  int? readInt(String key) => values[key] as int?;

  @override
  Future<void> writeBool(String key, bool value) async => values[key] = value;

  @override
  Future<void> writeInt(String key, int value) async => values[key] = value;
}

class _ReviewGateway implements ReviewGateway {
  bool available = true;
  int requestCount = 0;

  @override
  Future<bool> isAvailable() async => available;

  @override
  Future<void> requestReview() async => requestCount++;
}

class _RecordingSink implements AnalyticsEventSink {
  final List<Map<String, dynamic>> events = [];

  @override
  Future<void> write(Map<String, dynamic> event) async => events.add(event);
}

import 'dart:math';

import 'package:flow_music/core/analytics/product_analytics.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('track writes the common dimensions and event properties', () async {
    final sink = _RecordingSink();
    final analytics = ProductAnalytics(
      sink: sink,
      anonymousId: '10000000-0000-4000-8000-000000000001',
      sessionId: '20000000-0000-4000-8000-000000000002',
      platform: 'android',
      appVersion: '1.2.3+4',
      localeProvider: () => 'es-PA',
    );

    await analytics.track(
      'radio_played',
      properties: {'station_id': 'station-1', 'source': 'selection'},
    );

    expect(sink.events, hasLength(1));
    expect(sink.events.single, {
      'event_name': 'radio_played',
      'anonymous_id': '10000000-0000-4000-8000-000000000001',
      'session_id': '20000000-0000-4000-8000-000000000002',
      'platform': 'android',
      'app_version': '1.2.3+4',
      'locale': 'es-PA',
      'properties': {'station_id': 'station-1', 'source': 'selection'},
    });
  });

  test('generated analytics identifier is a version 4 UUID', () {
    final value = generateAnalyticsUuid(Random(7));

    expect(
      value,
      matches(
        RegExp(
          r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
        ),
      ),
    );
  });
}

class _RecordingSink implements AnalyticsEventSink {
  final List<Map<String, dynamic>> events = [];

  @override
  Future<void> write(Map<String, dynamic> event) async => events.add(event);
}

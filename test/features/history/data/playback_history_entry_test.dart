import 'package:flow_music/features/history/data/playback_history_entry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('round-trips radio station data for real recent playback cards', () {
    final entry = PlaybackHistoryEntry(
      id: 'station-1',
      title: 'Station 1',
      subtitle: 'Panama',
      thumbnailUrl: 'https://radio.example/icon.png',
      playedAt: DateTime.utc(2026, 8, 30),
      playCount: 2,
      kind: PlaybackHistoryKind.radio,
      stationData: const {
        'stationuuid': 'station-1',
        'url_resolved': 'https://radio.example/live',
        'tags': 'jazz',
      },
    );

    final restored = PlaybackHistoryEntry.fromJson(entry.toJson());

    expect(restored.stationData['stationuuid'], 'station-1');
    expect(restored.stationData['url_resolved'], 'https://radio.example/live');
  });
}

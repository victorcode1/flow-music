import 'dart:math';

import 'package:flow_music/features/radio/data/models/radio_station.dart';

class DailyRecommendationSlot {
  const DailyRecommendationSlot({
    required this.scheduledAt,
    required this.station,
  });

  final DateTime scheduledAt;
  final RadioStation station;
}

/// Builds one recommendation per calendar day without repeating a station
/// until all available candidates have been used.
List<DailyRecommendationSlot> buildDailyRecommendationPlan({
  required List<RadioStation> stations,
  required DateTime now,
  required int days,
  int hour = 18,
  Random? random,
}) {
  if (days <= 0 || stations.isEmpty) return const [];

  final playableById = <String, RadioStation>{};
  for (final station in stations) {
    if (!station.isPlayable || station.name.trim().isEmpty) continue;
    final id = station.stationUuid.trim().isNotEmpty
        ? station.stationUuid.trim()
        : station.streamUrl;
    playableById[id] = station;
  }
  final candidates = playableById.values.toList(growable: false);
  if (candidates.isEmpty) return const [];

  final selectionRandom = random ?? Random.secure();
  final firstToday = DateTime(now.year, now.month, now.day, hour);
  final firstDate = firstToday.isAfter(now)
      ? firstToday
      : DateTime(now.year, now.month, now.day + 1, hour);
  final remaining = <RadioStation>[];
  RadioStation? previous;

  RadioStation takeNext() {
    if (remaining.isEmpty) {
      remaining.addAll(candidates);
      remaining.shuffle(selectionRandom);
      if (previous != null && remaining.length > 1) {
        final previousId = _stationId(previous!);
        if (_stationId(remaining.last) == previousId) {
          final replacement = remaining.indexWhere(
            (station) => _stationId(station) != previousId,
          );
          final value = remaining[replacement];
          remaining[replacement] = remaining.last;
          remaining[remaining.length - 1] = value;
        }
      }
    }
    return remaining.removeLast();
  }

  return List<DailyRecommendationSlot>.generate(days, (index) {
    final station = takeNext();
    previous = station;
    return DailyRecommendationSlot(
      scheduledAt: DateTime(
        firstDate.year,
        firstDate.month,
        firstDate.day + index,
        hour,
      ),
      station: station,
    );
  }, growable: false);
}

String _stationId(RadioStation station) => station.stationUuid.trim().isNotEmpty
    ? station.stationUuid.trim()
    : station.streamUrl;

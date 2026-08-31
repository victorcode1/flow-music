import 'dart:math';

import 'package:flow_music/features/flow_mix/domain/flow_mix_feedback.dart';
import 'package:flow_music/features/flow_mix/domain/flow_mix_mood.dart';
import 'package:flow_music/features/history/data/playback_history_entry.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';

const Duration flowMixRepeatWindow = Duration(days: 7);

List<RadioStation> buildFlowMixQueue({
  required Iterable<RadioStation> candidates,
  required FlowMixMood mood,
  required Iterable<RadioStation> favorites,
  required Iterable<PlaybackHistoryEntry> history,
  required FlowMixFeedbackProfile feedback,
  String countryCode = '',
  DateTime? now,
  Random? random,
  int limit = 15,
}) {
  if (limit <= 0) return const [];

  final currentTime = now ?? DateTime.now();
  final randomSource = random ?? Random();
  final normalizedCountry = countryCode.trim().toUpperCase();
  final favoriteIds = favorites.map(flowMixStationId).toSet();
  final preferredTags = preferredFlowMixTags(favorites);
  final historyById = <String, PlaybackHistoryEntry>{
    for (final entry in history) entry.id: entry,
  };
  final recentIds = historyById.values
      .where(
        (entry) => currentTime.difference(entry.playedAt) < flowMixRepeatWindow,
      )
      .map((entry) => entry.id)
      .toSet();

  final unique = <String, RadioStation>{};
  for (final station in candidates) {
    final id = flowMixStationId(station);
    if (id.isEmpty || !station.isPlayable) continue;
    if (feedback.dismissedStationIds.contains(id)) continue;
    unique[id] = station;
  }

  final scored = unique.values
      .map(
        (station) => _ScoredStation(
          station: station,
          score:
              _scoreStation(
                station: station,
                mood: mood,
                favoriteIds: favoriteIds,
                preferredTags: preferredTags,
                historyById: historyById,
                negativeTagCounts: feedback.negativeTagCounts,
                countryCode: normalizedCountry,
                hour: currentTime.hour,
              ) +
              randomSource.nextDouble() * _randomnessFor(mood),
        ),
      )
      .toList();
  scored.sort((a, b) => b.score.compareTo(a.score));

  final fresh = scored
      .where((item) => !recentIds.contains(flowMixStationId(item.station)))
      .toList();
  final selected = <RadioStation>[];
  _selectDiverseStations(fresh, selected, limit);
  return List.unmodifiable(selected);
}

Set<String> preferredFlowMixTags(
  Iterable<RadioStation> stations, {
  int limit = 4,
}) {
  final counts = <String, int>{};
  for (final station in stations) {
    for (final tag in flowMixStationTags(station)) {
      if (_genericTags.contains(tag)) continue;
      counts.update(tag, (count) => count + 1, ifAbsent: () => 1);
    }
  }
  final ranked = counts.entries.toList()
    ..sort((a, b) {
      final countComparison = b.value.compareTo(a.value);
      return countComparison != 0 ? countComparison : a.key.compareTo(b.key);
    });
  return ranked.take(limit).map((entry) => entry.key).toSet();
}

Set<String> flowMixStationTags(RadioStation station) {
  return station.tags
      .split(',')
      .map(_normalizeTag)
      .where((tag) => tag.isNotEmpty)
      .toSet();
}

String flowMixStationId(RadioStation station) {
  return station.stationUuid.isEmpty ? station.streamUrl : station.stationUuid;
}

double _scoreStation({
  required RadioStation station,
  required FlowMixMood mood,
  required Set<String> favoriteIds,
  required Set<String> preferredTags,
  required Map<String, PlaybackHistoryEntry> historyById,
  required Map<String, int> negativeTagCounts,
  required String countryCode,
  required int hour,
}) {
  final id = flowMixStationId(station);
  final tags = flowMixStationTags(station);
  final moodMatches = tags.intersection(mood.discoveryTags.toSet()).length;
  final preferenceMatches = tags.intersection(preferredTags).length;
  final historyEntry = historyById[id];

  var score = 0.0;
  score += moodMatches * 64;
  score += preferenceMatches * 28;
  if (favoriteIds.contains(id)) score += 48;
  if (historyEntry != null) score += min(historyEntry.playCount, 8) * 5;

  if (countryCode.isNotEmpty &&
      station.countryCode.toUpperCase() == countryCode) {
    score += mood == FlowMixMood.local ? 150 : 24;
  } else if (mood == FlowMixMood.surprise && station.countryCode.isNotEmpty) {
    score += 12;
  }

  final momentTags = _momentTags(hour);
  score += tags.intersection(momentTags).length * 12;

  for (final tag in tags) {
    score -= (negativeTagCounts[tag] ?? 0) * 32;
  }

  if (station.isHttps) score += 12;
  if (station.lastCheckOk == 1) score += 18;
  if (station.bitrate >= 128) score += 8;
  score += min(log(station.clickCount + 1) / ln10 * 4, 18);
  score += min(log(station.votes + 1) / ln10 * 3, 12);
  return score;
}

void _selectDiverseStations(
  List<_ScoredStation> pool,
  List<RadioStation> selected,
  int limit,
) {
  final remaining = List<_ScoredStation>.from(pool);
  while (remaining.isNotEmpty && selected.length < limit) {
    var nextIndex = 0;
    if (selected.isNotEmpty) {
      final previous = selected.last;
      final previousTags = flowMixStationTags(previous);
      final diverseIndex = remaining.indexWhere((candidate) {
        final station = candidate.station;
        final differentCountry =
            station.countryCode.isEmpty ||
            previous.countryCode.isEmpty ||
            station.countryCode != previous.countryCode;
        final differentTags = flowMixStationTags(
          station,
        ).intersection(previousTags).isEmpty;
        return differentCountry || differentTags;
      });
      if (diverseIndex != -1) nextIndex = diverseIndex;
    }
    selected.add(remaining.removeAt(nextIndex).station);
  }
}

Set<String> _momentTags(int hour) {
  if (hour < 11) return const {'acoustic', 'jazz', 'classical'};
  if (hour < 19) return const {'pop', 'rock', 'dance'};
  return const {'chillout', 'ambient', 'jazz', 'lounge'};
}

double _randomnessFor(FlowMixMood mood) {
  return mood == FlowMixMood.surprise ? 80 : 18;
}

String _normalizeTag(String input) {
  final normalized = input.trim().toLowerCase().replaceAll(
    RegExp(r'[_\s-]+'),
    ' ',
  );
  return switch (normalized) {
    'chill' || 'chill out' => 'chillout',
    'lo fi' => 'lofi',
    _ => normalized,
  };
}

const _genericTags = {'music', 'radio', 'various', 'misc', 'internet radio'};

class _ScoredStation {
  const _ScoredStation({required this.station, required this.score});

  final RadioStation station;
  final double score;
}

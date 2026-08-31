import 'dart:convert';

import 'package:flow_music/features/flow_mix/domain/flow_mix_feedback.dart';
import 'package:flow_music/features/flow_mix/domain/flow_mix_plan.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

const String flowMixFeedbackBoxName = 'flow_mix_feedback';

class FlowMixFeedbackRepository {
  const FlowMixFeedbackRepository({DateTime Function()? now}) : _now = now;

  final DateTime Function()? _now;

  Box get _box => Hive.box(flowMixFeedbackBoxName);

  FlowMixFeedbackProfile readProfile() {
    final now = (_now ?? DateTime.now)().toUtc();
    final dismissedIds = <String>{};
    final negativeTagCounts = <String, int>{};
    for (final key in _box.keys) {
      final entry = _decode(_box.get(key));
      if (entry == null) continue;
      final age = now.difference(entry.dismissedAt);
      if (age <= const Duration(days: 90)) {
        dismissedIds.add(entry.stationId);
      }
      if (age <= const Duration(days: 30)) {
        for (final tag in entry.tags) {
          negativeTagCounts.update(
            tag,
            (count) => count + 1,
            ifAbsent: () => 1,
          );
        }
      }
    }
    return FlowMixFeedbackProfile(
      dismissedStationIds: Set.unmodifiable(dismissedIds),
      negativeTagCounts: Map.unmodifiable(negativeTagCounts),
    );
  }

  Future<void> recordLessLikeThis(RadioStation station) async {
    final id = flowMixStationId(station);
    if (id.isEmpty) return;
    final now = (_now ?? DateTime.now)().toUtc();
    final entry = _FlowMixFeedbackEntry(
      stationId: id,
      tags: flowMixStationTags(station).toList(growable: false),
      dismissedAt: now,
    );
    await _box.put(id, jsonEncode(entry.toJson()));
    await _prune(now);
  }

  Future<void> _prune(DateTime now) async {
    final staleKeys = <Object>[];
    for (final key in _box.keys) {
      final entry = _decode(_box.get(key));
      if (entry == null ||
          now.difference(entry.dismissedAt) > const Duration(days: 90)) {
        staleKeys.add(key);
      }
    }
    await _box.deleteAll(staleKeys);
  }

  _FlowMixFeedbackEntry? _decode(Object? raw) {
    try {
      if (raw is! String || raw.isEmpty) return null;
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      return _FlowMixFeedbackEntry.fromJson(decoded);
    } catch (error, stackTrace) {
      debugPrint('FlowMixFeedbackRepository decode failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }
}

class _FlowMixFeedbackEntry {
  const _FlowMixFeedbackEntry({
    required this.stationId,
    required this.tags,
    required this.dismissedAt,
  });

  factory _FlowMixFeedbackEntry.fromJson(Map<String, dynamic> json) {
    final rawTags = json['tags'];
    return _FlowMixFeedbackEntry(
      stationId: json['stationId'] as String? ?? '',
      tags: rawTags is List
          ? rawTags.whereType<String>().toList(growable: false)
          : const [],
      dismissedAt:
          DateTime.tryParse(json['dismissedAt'] as String? ?? '')?.toUtc() ??
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
    );
  }

  final String stationId;
  final List<String> tags;
  final DateTime dismissedAt;

  Map<String, dynamic> toJson() => {
    'stationId': stationId,
    'tags': tags,
    'dismissedAt': dismissedAt.toIso8601String(),
  };
}

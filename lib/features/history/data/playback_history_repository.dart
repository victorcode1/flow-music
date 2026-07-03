import 'dart:convert';

import 'package:flow_music/features/history/data/playback_history_entry.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

const String playbackHistoryBoxName = 'playback_history';

class PlaybackHistoryRepository {
  const PlaybackHistoryRepository();

  Box get _box => Hive.box(playbackHistoryBoxName);

  List<PlaybackHistoryEntry> readAll() {
    final entries = <PlaybackHistoryEntry>[];
    for (final key in _box.keys) {
      final entry = _decode(_box.get(key));
      if (entry != null) entries.add(entry);
    }
    entries.sort((a, b) => b.playedAt.compareTo(a.playedAt));
    return List.unmodifiable(entries);
  }

  Future<void> record(PlaybackHistoryEntry input) async {
    if (input.id.isEmpty) return;
    final existing = _decode(_box.get(input.id));
    final entry = input.copyWith(
      playedAt: DateTime.now(),
      playCount: (existing?.playCount ?? 0) + 1,
    );
    await _box.put(entry.id, jsonEncode(entry.toJson()));
    await _trim();
  }

  Future<void> clear() async {
    await _box.clear();
  }

  Future<void> _trim({int maxItems = 80}) async {
    final entries = readAll();
    if (entries.length <= maxItems) return;
    for (final entry in entries.skip(maxItems)) {
      await _box.delete(entry.id);
    }
  }

  PlaybackHistoryEntry? _decode(Object? raw) {
    try {
      if (raw is! String || raw.isEmpty) return null;
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      return PlaybackHistoryEntry.fromJson(decoded);
    } catch (error, stackTrace) {
      debugPrint('PlaybackHistoryRepository decode failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }
}

import 'dart:math';

import 'package:flow_music/features/autoplay/data/autoplay_resolver.dart';
import 'package:flow_music/features/autoplay/data/resolved_audio.dart';
import 'package:flow_music/features/autoplay/presentation/controllers/cache_status_controller.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flow_music/features/autoplay/data/audio_cache_stub.dart'
    if (dart.library.io) 'package:flow_music/features/autoplay/data/audio_cache_io.dart';

part 'autoplay_queue_controller.g.dart';

/// How many upcoming tracks to resolve in parallel after a tap. Keeping this
/// small avoids hammering Piped / youtube_explode_dart and burning data.
const int _prefetchWindow = 5;

class AutoplayQueueState {
  const AutoplayQueueState({
    required this.played,
    required this.current,
    required this.upcoming,
    required this.resolved,
    required this.inFlight,
  });

  /// Tracks already played in this session, most-recent last.
  final List<YouTubeSearchSuggestion> played;

  /// The track that is currently playing (or about to play).
  final YouTubeSearchSuggestion? current;

  /// Tracks still waiting to play, in order.
  final List<YouTubeSearchSuggestion> upcoming;

  /// Resolved audio info keyed by videoId. Populated as prefetches succeed
  /// and consulted both for auto-advance and for manual next/prev navigation.
  final Map<String, ResolvedAudio> resolved;

  /// VideoIds currently being resolved.
  final Set<String> inFlight;

  static const AutoplayQueueState empty = AutoplayQueueState(
    played: [],
    current: null,
    upcoming: [],
    resolved: {},
    inFlight: {},
  );

  bool get hasNext => upcoming.isNotEmpty;
  bool get hasPrevious => played.isNotEmpty;

  AutoplayQueueState copyWith({
    List<YouTubeSearchSuggestion>? played,
    Object? current = _noChange,
    List<YouTubeSearchSuggestion>? upcoming,
    Map<String, ResolvedAudio>? resolved,
    Set<String>? inFlight,
  }) {
    return AutoplayQueueState(
      played: played ?? this.played,
      current: identical(current, _noChange)
          ? this.current
          : current as YouTubeSearchSuggestion?,
      upcoming: upcoming ?? this.upcoming,
      resolved: resolved ?? this.resolved,
      inFlight: inFlight ?? this.inFlight,
    );
  }
}

const Object _noChange = Object();

class NextTrack {
  const NextTrack({required this.suggestion, this.resolved});

  final YouTubeSearchSuggestion suggestion;
  final ResolvedAudio? resolved;
}

/// Holds the search-results queue and pre-resolved audio URLs / cached files.
///
/// When a search result is tapped, the parent calls [enqueue] with the full
/// result list and the tapped index. The queue keeps the tapped track as
/// `current` and the surrounding tracks as `played` (before) and `upcoming`
/// (after), then kicks off parallel resolution + caching for the first few
/// upcoming items so next/prev navigation is instant.
@Riverpod(keepAlive: true)
class AutoplayQueueController extends _$AutoplayQueueController {
  @override
  AutoplayQueueState build() => AutoplayQueueState.empty;

  /// Replace the queue with [results], centring on [selectedIndex] as the
  /// currently-playing track and start prefetching its successors.
  void enqueue(List<YouTubeSearchSuggestion> results, int selectedIndex) {
    if (selectedIndex < 0 || selectedIndex >= results.length) {
      state = AutoplayQueueState.empty;
      return;
    }
    final filtered = results
        .where((item) => item.videoId.isNotEmpty)
        .toList(growable: false);
    final newIndex = filtered.indexWhere(
      (item) => item.videoId == results[selectedIndex].videoId,
    );
    if (newIndex == -1) {
      state = AutoplayQueueState.empty;
      return;
    }

    state = AutoplayQueueState(
      played: filtered.sublist(0, newIndex),
      current: filtered[newIndex],
      upcoming: filtered.sublist(newIndex + 1),
      resolved: const {},
      inFlight: const {},
    );

    _prefetchHead();
  }

  /// Advance to the next track. Returns the new current (with prefetched
  /// audio if ready) or null when the queue is exhausted.
  NextTrack? playNext() {
    final current = state;
    if (current.upcoming.isEmpty) return null;

    final next = current.upcoming.first;
    final remaining = current.upcoming.sublist(1);
    final played = [
      ...current.played,
      if (current.current != null) current.current!,
    ];
    final resolvedAudio = current.resolved[next.videoId];

    state = current.copyWith(
      played: played,
      current: next,
      upcoming: remaining,
    );
    _prefetchHead();
    return NextTrack(suggestion: next, resolved: resolvedAudio);
  }

  NextTrack? playUpcomingAt(int index) {
    final current = state;
    if (index < 0 || index >= current.upcoming.length) return null;

    final next = current.upcoming[index];
    final before = current.upcoming.sublist(0, index);
    final after = current.upcoming.sublist(index + 1);
    final played = [
      ...current.played,
      if (current.current != null) current.current!,
      ...before,
    ];
    final resolvedAudio = current.resolved[next.videoId];

    state = current.copyWith(played: played, current: next, upcoming: after);
    _prefetchHead();
    return NextTrack(suggestion: next, resolved: resolvedAudio);
  }

  /// Go back to the previously-played track. Returns null when there is no
  /// history.
  NextTrack? playPrevious() {
    final current = state;
    if (current.played.isEmpty) return null;

    final previous = current.played.last;
    final played = current.played.sublist(0, current.played.length - 1);
    final upcoming = [
      if (current.current != null) current.current!,
      ...current.upcoming,
    ];
    final resolvedAudio = current.resolved[previous.videoId];

    state = current.copyWith(
      played: played,
      current: previous,
      upcoming: upcoming,
    );
    _prefetchHead();
    return NextTrack(suggestion: previous, resolved: resolvedAudio);
  }

  void clear() {
    state = AutoplayQueueState.empty;
  }

  void clearUpcoming() {
    state = state.copyWith(upcoming: const []);
  }

  void removeUpcomingAt(int index) {
    if (index < 0 || index >= state.upcoming.length) return;
    final next = [...state.upcoming]..removeAt(index);
    state = state.copyWith(upcoming: next);
    _prefetchHead();
  }

  /// Baraja aleatoriamente las pistas que faltan por reproducir (Fisher-Yates),
  /// conservando la pista actual y el historial. Reinicia el prefetch del nuevo
  /// encabezado de la cola.
  void shuffleUpcoming() {
    final upcoming = [...state.upcoming];
    if (upcoming.length < 2) return;
    final random = Random();
    for (var i = upcoming.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final tmp = upcoming[i];
      upcoming[i] = upcoming[j];
      upcoming[j] = tmp;
    }
    state = state.copyWith(upcoming: upcoming);
    _prefetchHead();
  }

  void moveUpcoming(int oldIndex, int newIndex) {
    final current = [...state.upcoming];
    if (oldIndex < 0 || oldIndex >= current.length) return;
    final target = newIndex;
    if (target < 0 || target > current.length) return;
    final item = current.removeAt(oldIndex);
    current.insert(target, item);
    state = state.copyWith(upcoming: current);
    _prefetchHead();
  }

  void _prefetchHead() {
    final snapshot = state;
    final targets = snapshot.upcoming.take(_prefetchWindow);
    for (final suggestion in targets) {
      final id = suggestion.videoId;
      if (snapshot.resolved.containsKey(id)) continue;
      if (snapshot.inFlight.contains(id)) continue;
      _prefetch(suggestion);
    }
  }

  Future<void> _prefetch(YouTubeSearchSuggestion suggestion) async {
    final id = suggestion.videoId;
    state = state.copyWith(inFlight: {...state.inFlight, id});

    final resolved = await resolveAudioFor(suggestion);

    var snapshot = state;
    final relevant = _isStillRelevant(snapshot, id);
    final inFlightAfterResolve = {...snapshot.inFlight}..remove(id);

    if (!relevant || resolved == null) {
      state = snapshot.copyWith(inFlight: inFlightAfterResolve);
      if (resolved == null) {
        debugPrint('Autoplay prefetch: no audio resolved for $id');
      }
      return;
    }

    state = snapshot.copyWith(
      resolved: {...snapshot.resolved, id: resolved},
      inFlight: inFlightAfterResolve,
    );
    debugPrint('Autoplay prefetch ready for $id');

    // Skip the disk cache entirely if we've already learned the device is out
    // of room — keep playing from the network URL.
    if (ref.read(cacheStatusControllerProvider).diskFull) return;

    final cacheResult = await cacheAudioToDisk(
      videoId: id,
      url: resolved.audioUrl,
    );
    if (cacheResult.diskFull) {
      ref.read(cacheStatusControllerProvider.notifier).markDiskFull();
      return;
    }
    final cachePath = cacheResult.filePath;
    if (cachePath == null) return;

    snapshot = state;
    if (!_isStillRelevant(snapshot, id)) return;
    final existing = snapshot.resolved[id];
    if (existing == null) return;

    state = snapshot.copyWith(
      resolved: {
        ...snapshot.resolved,
        id: existing.copyWith(cacheFilePath: cachePath),
      },
    );
    debugPrint('Autoplay cache ready for $id at $cachePath');
  }

  bool _isStillRelevant(AutoplayQueueState snapshot, String videoId) {
    if (snapshot.upcoming.any((item) => item.videoId == videoId)) return true;
    if (snapshot.played.any((item) => item.videoId == videoId)) return true;
    return snapshot.current?.videoId == videoId;
  }
}

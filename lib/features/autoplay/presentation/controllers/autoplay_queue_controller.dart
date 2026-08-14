import 'dart:async';
import 'dart:math';

import 'package:flow_music/features/autoplay/data/autoplay_resolver.dart';
import 'package:flow_music/features/autoplay/data/resolved_audio.dart';
import 'package:flow_music/features/autoplay/presentation/controllers/cache_status_controller.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/features/search/data/repositories/youtube_suggestions_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flow_music/features/autoplay/data/audio_cache_stub.dart'
    if (dart.library.io) 'package:flow_music/features/autoplay/data/audio_cache_io.dart';

part 'autoplay_queue_controller.g.dart';

/// How many upcoming tracks to resolve in parallel after a tap. Keeping this
/// small avoids hammering Piped / youtube_explode_dart and burning data.
const int _prefetchWindow = 5;

/// Start looking for more music before the visible queue can run dry. A
/// successful refill normally brings it back to [_queueTargetLength].
const int _queueRefillThreshold = 4;
const int _queueTargetLength = 10;
const int _maxRefillBatches = 3;
const int _maxPlayedHistory = 40;

typedef AutoplaySuggestionLoader =
    Future<List<YouTubeSearchSuggestion>> Function(String query);
typedef AutoplayAudioResolver =
    Future<ResolvedAudio?> Function(YouTubeSearchSuggestion suggestion);

/// Kept behind providers so queue behaviour can be tested without making
/// real YouTube/Piped requests.
final autoplaySuggestionLoaderProvider = Provider<AutoplaySuggestionLoader>((
  ref,
) {
  return (query) =>
      fetchYouTubeSearchSuggestions(query, source: 'AutoplayQueue');
});

final autoplayAudioResolverProvider = Provider<AutoplayAudioResolver>((ref) {
  return resolveAudioFor;
});

class AutoplayQueueState {
  const AutoplayQueueState({
    required this.played,
    required this.current,
    required this.upcoming,
    required this.resolved,
    required this.inFlight,
    required this.isLoadingMore,
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

  /// Whether related songs are currently being appended to [upcoming].
  final bool isLoadingMore;

  static const AutoplayQueueState empty = AutoplayQueueState(
    played: [],
    current: null,
    upcoming: [],
    resolved: {},
    inFlight: {},
    isLoadingMore: false,
  );

  /// An active autoplay session can always request another track. If the
  /// buffer happens to be empty, [AutoplayQueueController.playNext] waits for
  /// an urgent refill instead of leaving the button disabled.
  bool get hasNext => current != null;
  bool get hasPrevious => played.isNotEmpty;

  AutoplayQueueState copyWith({
    List<YouTubeSearchSuggestion>? played,
    Object? current = _noChange,
    List<YouTubeSearchSuggestion>? upcoming,
    Map<String, ResolvedAudio>? resolved,
    Set<String>? inFlight,
    bool? isLoadingMore,
  }) {
    return AutoplayQueueState(
      played: played ?? this.played,
      current: identical(current, _noChange)
          ? this.current
          : current as YouTubeSearchSuggestion?,
      upcoming: upcoming ?? this.upcoming,
      resolved: resolved ?? this.resolved,
      inFlight: inFlight ?? this.inFlight,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
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
  int _queueGeneration = 0;
  int _refillFailures = 0;
  Future<void>? _refillFuture;
  Timer? _refillRetryTimer;
  final Set<String> _usedRefillQueries = {};

  @override
  AutoplayQueueState build() {
    ref.onDispose(() => _refillRetryTimer?.cancel());
    return AutoplayQueueState.empty;
  }

  /// Replace the queue with [results], centring on [selectedIndex] as the
  /// currently-playing track and start prefetching its successors.
  void enqueue(List<YouTubeSearchSuggestion> results, int selectedIndex) {
    if (selectedIndex < 0 || selectedIndex >= results.length) {
      clear();
      return;
    }
    final filtered = results
        .where((item) => item.videoId.isNotEmpty)
        .toList(growable: false);
    final newIndex = filtered.indexWhere(
      (item) => item.videoId == results[selectedIndex].videoId,
    );
    if (newIndex == -1) {
      clear();
      return;
    }

    _beginNewQueue();

    state = AutoplayQueueState(
      played: filtered.sublist(0, newIndex),
      current: filtered[newIndex],
      upcoming: filtered.sublist(newIndex + 1),
      resolved: const {},
      inFlight: const {},
      isLoadingMore: false,
    );

    _prefetchHead();
    unawaited(_maintainQueueBuffer());
  }

  /// Advance to the next track. Returns the new current (with prefetched
  /// audio if ready). When the visible queue is momentarily empty, waits for
  /// the in-progress background refill before giving up.
  Future<NextTrack?> playNext() async {
    if (!await ensureNext()) return null;

    final current = state;
    if (current.upcoming.isEmpty) return null;

    final next = current.upcoming.first;
    final remaining = current.upcoming.sublist(1);
    final completeHistory = [
      ...current.played,
      if (current.current != null) current.current!,
    ];
    final played = completeHistory.length <= _maxPlayedHistory
        ? completeHistory
        : completeHistory.sublist(completeHistory.length - _maxPlayedHistory);
    final resolvedAudio = current.resolved[next.videoId];

    state = current.copyWith(
      played: played,
      current: next,
      upcoming: remaining,
    );
    _pruneResolvedEntries();
    _prefetchHead();
    unawaited(_maintainQueueBuffer());
    return NextTrack(suggestion: next, resolved: resolvedAudio);
  }

  /// Ensure there is a concrete next song. This is public so playback entry
  /// points can await an urgent network refill when necessary.
  Future<bool> ensureNext() async {
    if (state.current == null) return false;
    if (state.upcoming.isNotEmpty) {
      unawaited(_maintainQueueBuffer());
      return true;
    }

    await _maintainQueueBuffer(force: true);
    return state.upcoming.isNotEmpty;
  }

  NextTrack? playUpcomingAt(int index) {
    final current = state;
    if (index < 0 || index >= current.upcoming.length) return null;

    final next = current.upcoming[index];
    final before = current.upcoming.sublist(0, index);
    final after = current.upcoming.sublist(index + 1);
    final played = _boundedHistory([
      ...current.played,
      if (current.current != null) current.current!,
      ...before,
    ]);
    final resolvedAudio = current.resolved[next.videoId];

    state = current.copyWith(played: played, current: next, upcoming: after);
    _pruneResolvedEntries();
    _prefetchHead();
    unawaited(_maintainQueueBuffer());
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
    _pruneResolvedEntries();
    _prefetchHead();
    unawaited(_maintainQueueBuffer());
    return NextTrack(suggestion: previous, resolved: resolvedAudio);
  }

  void clear() {
    _beginNewQueue();
    state = AutoplayQueueState.empty;
  }

  void clearUpcoming() {
    state = state.copyWith(upcoming: const []);
    _pruneResolvedEntries();
    unawaited(_maintainQueueBuffer(force: true));
  }

  void removeUpcomingAt(int index) {
    if (index < 0 || index >= state.upcoming.length) return;
    final next = [...state.upcoming]..removeAt(index);
    state = state.copyWith(upcoming: next);
    _pruneResolvedEntries();
    _prefetchHead();
    unawaited(_maintainQueueBuffer());
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
    unawaited(_maintainQueueBuffer());
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
    unawaited(_maintainQueueBuffer());
  }

  void _beginNewQueue() {
    _queueGeneration++;
    _refillFailures = 0;
    _refillRetryTimer?.cancel();
    _refillRetryTimer = null;
    _refillFuture = null;
    _usedRefillQueries.clear();
  }

  Future<void> _maintainQueueBuffer({bool force = false}) {
    if (!ref.mounted) return Future.value();
    if (state.current == null) return Future.value();
    if (!force && state.upcoming.length > _queueRefillThreshold) {
      return Future.value();
    }

    final activeRefill = _refillFuture;
    if (activeRefill != null) return activeRefill;

    _refillRetryTimer?.cancel();
    _refillRetryTimer = null;
    final generation = _queueGeneration;
    final refill = _refillQueue(generation);
    _refillFuture = refill;
    unawaited(
      refill.whenComplete(() {
        if (identical(_refillFuture, refill)) {
          _refillFuture = null;
        }
      }),
    );
    return refill;
  }

  Future<void> _refillQueue(int generation) async {
    if (!ref.mounted ||
        generation != _queueGeneration ||
        state.current == null) {
      return;
    }
    state = state.copyWith(isLoadingMore: true);

    var addedAny = false;
    try {
      for (
        var batch = 0;
        batch < _maxRefillBatches && state.upcoming.length < _queueTargetLength;
        batch++
      ) {
        if (!ref.mounted ||
            generation != _queueGeneration ||
            state.current == null) {
          return;
        }

        final seed = state.upcoming.isNotEmpty
            ? state.upcoming.last
            : state.current!;
        final query = _nextRefillQuery(seed);
        if (query == null) break;

        final fetched = await ref.read(autoplaySuggestionLoaderProvider)(query);
        if (!ref.mounted ||
            generation != _queueGeneration ||
            state.current == null) {
          return;
        }

        final seen = <String>{
          ...state.played.map((item) => item.videoId),
          state.current!.videoId,
          ...state.upcoming.map((item) => item.videoId),
        };
        final additions = fetched
            .where((item) => item.videoId.isNotEmpty && seen.add(item.videoId))
            .take(_queueTargetLength - state.upcoming.length)
            .toList(growable: false);
        if (additions.isEmpty) continue;

        addedAny = true;
        state = state.copyWith(upcoming: [...state.upcoming, ...additions]);
        _prefetchHead();
      }
    } catch (error, stackTrace) {
      debugPrint('Autoplay queue refill failed: $error');
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      if (ref.mounted &&
          generation == _queueGeneration &&
          state.current != null) {
        state = state.copyWith(isLoadingMore: false);
        if (addedAny) {
          _refillFailures = 0;
        }
        if (state.upcoming.length <= _queueRefillThreshold) {
          _scheduleRefillRetry(generation);
        }
      }
    }
  }

  String? _nextRefillQuery(YouTubeSearchSuggestion seed) {
    final title = seed.displayText.trim();
    final artist = seed.channelTitle.trim();
    final candidates = <String>[
      if (title.isNotEmpty && artist.isNotEmpty) '$title $artist similar songs',
      if (artist.isNotEmpty) '$artist popular songs',
      if (title.isNotEmpty) '$title music mix',
      if (artist.isNotEmpty) '$artist music mix',
    ];
    for (final candidate in candidates) {
      final normalized = candidate.toLowerCase();
      if (_usedRefillQueries.add(normalized)) return candidate;
    }
    // All variants for the same tail were already attempted. Allow them to be
    // retried after the exponential backoff: a previous failure may simply
    // have been a temporary network/provider outage.
    _usedRefillQueries.clear();
    if (candidates.isEmpty) return null;
    final candidate = candidates.first;
    _usedRefillQueries.add(candidate.toLowerCase());
    return candidate;
  }

  void _scheduleRefillRetry(int generation) {
    if (_refillRetryTimer != null || generation != _queueGeneration) return;
    final exponent = min(_refillFailures, 4);
    final delay = Duration(seconds: 2 << exponent);
    _refillFailures++;
    _refillRetryTimer = Timer(delay, () {
      _refillRetryTimer = null;
      if (!ref.mounted ||
          generation != _queueGeneration ||
          state.current == null) {
        return;
      }
      unawaited(_maintainQueueBuffer(force: true));
    });
  }

  void _pruneResolvedEntries() {
    final relevantIds = <String>{
      ...state.played.map((item) => item.videoId),
      if (state.current != null) state.current!.videoId,
      ...state.upcoming.map((item) => item.videoId),
    };
    state = state.copyWith(
      resolved: Map.fromEntries(
        state.resolved.entries.where(
          (entry) => relevantIds.contains(entry.key),
        ),
      ),
    );
  }

  List<YouTubeSearchSuggestion> _boundedHistory(
    List<YouTubeSearchSuggestion> history,
  ) {
    if (history.length <= _maxPlayedHistory) return history;
    return history.sublist(history.length - _maxPlayedHistory);
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

    final resolved = await ref.read(autoplayAudioResolverProvider)(suggestion);
    if (!ref.mounted) return;

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
    if (!ref.mounted) return;
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
    unawaited(trimAudioCache(maxFiles: _queueTargetLength + _prefetchWindow));
    debugPrint('Autoplay cache ready for $id at $cachePath');
  }

  bool _isStillRelevant(AutoplayQueueState snapshot, String videoId) {
    if (snapshot.upcoming.any((item) => item.videoId == videoId)) return true;
    if (snapshot.played.any((item) => item.videoId == videoId)) return true;
    return snapshot.current?.videoId == videoId;
  }
}

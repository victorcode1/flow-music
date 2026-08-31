import 'dart:async';

import 'package:flow_music/core/analytics/product_analytics.dart';
import 'package:flow_music/features/flow_mix/data/flow_mix_catalog_repository.dart';
import 'package:flow_music/features/flow_mix/data/flow_mix_feedback_repository.dart';
import 'package:flow_music/features/flow_mix/domain/flow_mix_mood.dart';
import 'package:flow_music/features/flow_mix/domain/flow_mix_plan.dart';
import 'package:flow_music/features/history/presentation/controllers/playback_history_controller.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_favorites_controller.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_queue_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flowMixCatalogRepositoryProvider = Provider<FlowMixCatalogRepository>(
  (ref) => FlowMixCatalogRepository(),
);

final flowMixFeedbackRepositoryProvider = Provider<FlowMixFeedbackRepository>(
  (ref) => const FlowMixFeedbackRepository(),
);

final flowMixControllerProvider =
    NotifierProvider<FlowMixController, FlowMixState>(FlowMixController.new);

enum FlowMixStatus { idle, loading, ready, failure }

@immutable
class FlowMixState {
  const FlowMixState({
    this.status = FlowMixStatus.idle,
    this.mood,
    this.stations = const [],
  });

  final FlowMixStatus status;
  final FlowMixMood? mood;
  final List<RadioStation> stations;

  bool get isLoading => status == FlowMixStatus.loading;
  bool get hasError => status == FlowMixStatus.failure;

  bool contains(RadioStation station) {
    final id = flowMixStationId(station);
    return stations.any((candidate) => flowMixStationId(candidate) == id);
  }

  bool ownsQueue(Iterable<RadioStation> queue) {
    final queueIds = queue.map(flowMixStationId).toList(growable: false);
    final stationIds = stations.map(flowMixStationId).toList(growable: false);
    if (queueIds.length != stationIds.length) return false;
    for (var index = 0; index < queueIds.length; index++) {
      if (queueIds[index] != stationIds[index]) return false;
    }
    return queueIds.isNotEmpty;
  }
}

class FlowMixController extends Notifier<FlowMixState> {
  int _requestId = 0;

  @override
  FlowMixState build() => const FlowMixState();

  Future<RadioStation?> start({
    required FlowMixMood mood,
    String countryCode = '',
  }) async {
    final requestId = ++_requestId;
    state = FlowMixState(status: FlowMixStatus.loading, mood: mood);
    final favorites = ref.read(radioFavoritesControllerProvider);
    final history = ref.read(playbackHistoryControllerProvider);
    final effectiveCountry = countryCode.trim().isNotEmpty
        ? countryCode.trim().toUpperCase()
        : _favoriteCountryCode(favorites);

    try {
      final candidates = await ref
          .read(flowMixCatalogRepositoryProvider)
          .loadCandidates(
            mood: mood,
            favorites: favorites,
            preferredTags: preferredFlowMixTags(favorites),
            countryCode: effectiveCountry,
          );
      if (requestId != _requestId) return null;

      final queue = buildFlowMixQueue(
        candidates: candidates,
        mood: mood,
        favorites: favorites,
        history: history,
        feedback: ref.read(flowMixFeedbackRepositoryProvider).readProfile(),
        countryCode: effectiveCountry,
      );
      if (queue.isEmpty) {
        state = FlowMixState(status: FlowMixStatus.failure, mood: mood);
        return null;
      }

      ref.read(radioQueueControllerProvider.notifier).enqueue(queue, 0);
      state = FlowMixState(
        status: FlowMixStatus.ready,
        mood: mood,
        stations: queue,
      );
      unawaited(
        ref
            .read(productAnalyticsProvider)
            .track(
              'flow_mix_created',
              properties: {
                'mood': mood.name,
                'queue_size': queue.length,
                'history_count': history.length,
                'favorites_count': favorites.length,
              },
            ),
      );
      return queue.first;
    } catch (error, stackTrace) {
      debugPrint('Unable to build Flow Mix: $error');
      debugPrintStack(stackTrace: stackTrace);
      if (requestId == _requestId) {
        state = FlowMixState(status: FlowMixStatus.failure, mood: mood);
      }
      return null;
    }
  }

  Future<void> lessLikeThis(RadioStation station) async {
    await ref
        .read(flowMixFeedbackRepositoryProvider)
        .recordLessLikeThis(station);
    unawaited(
      ref
          .read(productAnalyticsProvider)
          .track(
            'flow_mix_less_like_this',
            properties: {
              if (state.mood != null) 'mood': state.mood!.name,
              if (station.countryCode.isNotEmpty)
                'country_code': station.countryCode.toUpperCase(),
            },
          ),
    );
  }

  void recordPlaybackStarted() {
    final mood = state.mood;
    if (mood == null) return;
    unawaited(
      ref
          .read(productAnalyticsProvider)
          .track(
            'flow_mix_started',
            properties: {
              'mood': mood.name,
              'queue_size': state.stations.length,
            },
          ),
    );
  }

  String _favoriteCountryCode(Iterable<RadioStation> favorites) {
    final counts = <String, int>{};
    for (final station in favorites) {
      final code = station.countryCode.trim().toUpperCase();
      if (code.isEmpty) continue;
      counts.update(code, (count) => count + 1, ifAbsent: () => 1);
    }
    if (counts.isEmpty) return '';
    final ranked = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return ranked.first.key;
  }
}

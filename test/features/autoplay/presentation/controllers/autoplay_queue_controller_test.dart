import 'dart:async';

import 'package:flow_music/features/autoplay/presentation/controllers/autoplay_queue_controller.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  test(
    'playNext waits for a background refill when the queue is empty',
    () async {
      final loaderStarted = Completer<void>();
      final loaderResult = Completer<List<YouTubeSearchSuggestion>>();
      final queries = <String>[];
      final container = ProviderContainer(
        overrides: [
          autoplaySuggestionLoaderProvider.overrideWithValue((query) {
            queries.add(query);
            if (!loaderStarted.isCompleted) loaderStarted.complete();
            return loaderResult.future;
          }),
          autoplayAudioResolverProvider.overrideWithValue((_) async => null),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(autoplayQueueControllerProvider.notifier);
      const current = YouTubeSearchSuggestion(
        videoId: 'current-song',
        displayText: 'Current song',
        channelTitle: 'Current artist',
        thumbnailUrl: '',
      );
      const next = YouTubeSearchSuggestion(
        videoId: 'next-song',
        displayText: 'Next song',
        channelTitle: 'Next artist',
        thumbnailUrl: '',
      );

      notifier.enqueue(const [current], 0);
      await loaderStarted.future;

      final loadingState = container.read(autoplayQueueControllerProvider);
      expect(loadingState.hasNext, isTrue);
      expect(loadingState.isLoadingMore, isTrue);

      final nextTrackFuture = notifier.playNext();
      loaderResult.complete(const [current, next, next]);
      final nextTrack = await nextTrackFuture;

      expect(nextTrack?.suggestion.videoId, next.videoId);
      expect(
        container.read(autoplayQueueControllerProvider).current?.videoId,
        next.videoId,
      );
      expect(queries.first, contains('Current song'));
    },
  );

  test('refills before the remaining songs are exhausted', () async {
    final loaderStarted = Completer<void>();
    final loaderResult = Completer<List<YouTubeSearchSuggestion>>();
    final refillCompleted = Completer<void>();
    final container = ProviderContainer(
      overrides: [
        autoplaySuggestionLoaderProvider.overrideWithValue((query) {
          if (!loaderStarted.isCompleted) loaderStarted.complete();
          return loaderResult.future;
        }),
        autoplayAudioResolverProvider.overrideWithValue((_) async => null),
      ],
    );
    addTearDown(container.dispose);

    final subscription = container.listen(autoplayQueueControllerProvider, (
      previous,
      next,
    ) {
      if (!next.isLoadingMore &&
          next.upcoming.any((song) => song.videoId == 'refilled-song') &&
          !refillCompleted.isCompleted) {
        refillCompleted.complete();
      }
    });
    addTearDown(subscription.close);

    final notifier = container.read(autoplayQueueControllerProvider.notifier);
    const current = YouTubeSearchSuggestion(
      videoId: 'current-song',
      displayText: 'Current song',
      channelTitle: 'Current artist',
      thumbnailUrl: '',
    );
    const queuedOne = YouTubeSearchSuggestion(
      videoId: 'queued-one',
      displayText: 'Queued one',
      channelTitle: 'Artist',
      thumbnailUrl: '',
    );
    const queuedTwo = YouTubeSearchSuggestion(
      videoId: 'queued-two',
      displayText: 'Queued two',
      channelTitle: 'Artist',
      thumbnailUrl: '',
    );
    const refilled = YouTubeSearchSuggestion(
      videoId: 'refilled-song',
      displayText: 'Refilled song',
      channelTitle: 'Another artist',
      thumbnailUrl: '',
    );

    notifier.enqueue(const [current, queuedOne, queuedTwo], 0);
    await loaderStarted.future;
    expect(
      container.read(autoplayQueueControllerProvider).upcoming,
      hasLength(2),
    );

    loaderResult.complete(const [current, queuedOne, refilled]);
    await refillCompleted.future;

    final upcoming = container.read(autoplayQueueControllerProvider).upcoming;
    expect(upcoming.map((song) => song.videoId), [
      queuedOne.videoId,
      queuedTwo.videoId,
      refilled.videoId,
    ]);
  });
}

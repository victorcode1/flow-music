import 'package:flow_music/features/home/data/home_suggestions_cache.dart';
import 'package:flow_music/features/home/data/home_suggestions_repository.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const result = HomeSuggestionsResult(
    countryName: 'Colombia',
    suggestions: [
      YouTubeSearchSuggestion(
        videoId: 'song-one',
        displayText: 'Song one',
        channelTitle: 'Artist one',
        thumbnailUrl: 'https://example.com/one.jpg',
        duration: Duration(minutes: 3, seconds: 20),
      ),
      YouTubeSearchSuggestion(
        videoId: 'song-two',
        displayText: 'Song two',
        channelTitle: 'Artist two',
        thumbnailUrl: '',
      ),
    ],
  );

  test('a cached batch survives the round trip to disk', () {
    final savedAt = DateTime(2026, 8, 18, 10, 30);
    final restored = decodeCachedHomeSuggestions(
      encodeCachedHomeSuggestions(result: result, savedAt: savedAt),
    );

    expect(restored, isNotNull);
    expect(restored!.savedAt, savedAt);
    expect(restored.result.countryName, 'Colombia');
    expect(restored.result.suggestions.map((song) => song.videoId), [
      'song-one',
      'song-two',
    ]);
    final first = restored.result.suggestions.first;
    expect(first.displayText, 'Song one');
    expect(first.channelTitle, 'Artist one');
    expect(first.thumbnailUrl, 'https://example.com/one.jpg');
    expect(first.duration, const Duration(minutes: 3, seconds: 20));
    expect(restored.result.suggestions.last.duration, isNull);
  });

  test('a batch older than an hour is stale, a recent one is not', () {
    final fresh = decodeCachedHomeSuggestions(
      encodeCachedHomeSuggestions(
        result: result,
        savedAt: DateTime.now().subtract(const Duration(minutes: 59)),
      ),
    );
    final old = decodeCachedHomeSuggestions(
      encodeCachedHomeSuggestions(
        result: result,
        savedAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    );

    expect(fresh!.isStale, isFalse);
    expect(old!.isStale, isTrue);
  });

  test('anything unexpected on disk is ignored instead of shown', () {
    expect(decodeCachedHomeSuggestions(''), isNull);
    expect(decodeCachedHomeSuggestions('not json'), isNull);
    expect(decodeCachedHomeSuggestions('{"savedAt":"nope"}'), isNull);
    // Sin pistas utilizables no hay nada que pintar.
    expect(
      decodeCachedHomeSuggestions(
        '{"savedAt":"2026-08-18T10:00:00.000","suggestions":[{"videoId":""}]}',
      ),
      isNull,
    );
  });
}

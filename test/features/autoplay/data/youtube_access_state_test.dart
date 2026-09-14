import 'package:flow_music/features/autoplay/data/youtube_access_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

void main() {
  setUp(resetYoutubeRateLimit);
  tearDown(resetYoutubeRateLimit);

  test('a rate limit from YouTube routes everything through Piped', () {
    expect(isYoutubeRateLimited, isFalse);

    final reported = reportYoutubeFailure(
      RequestLimitExceededException('too many requests'),
    );

    expect(reported, isTrue);
    expect(isYoutubeRateLimited, isTrue);
  });

  test('any other failure does not open the circuit', () {
    expect(reportYoutubeFailure(StateError('no audio streams')), isFalse);
    expect(reportYoutubeFailure(Exception('network down')), isFalse);
    expect(isYoutubeRateLimited, isFalse);
  });
}

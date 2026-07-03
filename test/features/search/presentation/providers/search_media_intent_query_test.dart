import 'package:flow_music/features/search/presentation/providers/search_media_intent_query.dart';
import 'package:flow_music/features/song/presentation/controllers/song_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('buildSearchQueryWithMediaIntent', () {
    test('appends cancion for audio searches', () {
      expect(
        buildSearchQueryWithMediaIntent('yemil', PlaybackMode.audio),
        'yemil cancion',
      );
    });

    test('appends video for video searches', () {
      expect(
        buildSearchQueryWithMediaIntent('yemil', PlaybackMode.video),
        'yemil video',
      );
    });

    test('replaces a trailing media intent when the mode changes', () {
      expect(
        buildSearchQueryWithMediaIntent('yemil cancion', PlaybackMode.video),
        'yemil video',
      );
      expect(
        buildSearchQueryWithMediaIntent('yemil video', PlaybackMode.audio),
        'yemil cancion',
      );
    });

    test('handles accented cancion at the end', () {
      expect(
        buildSearchQueryWithMediaIntent('yemil canción', PlaybackMode.video),
        'yemil video',
      );
    });
  });
}

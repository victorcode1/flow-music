import 'package:flow_music/features/search/data/repositories/song_title_normalizer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('collapses the official upload and the topic-channel reupload', () {
    final official = songDedupKey(
      title: 'Bad Bunny - Tití Me Preguntó (Video Oficial)',
      artist: 'Bad Bunny',
    );
    final topic = songDedupKey(
      title: 'Tití Me Preguntó',
      artist: 'Bad Bunny - Topic',
    );
    final lyrics = songDedupKey(
      title: 'Tití Me Preguntó (Letra/Lyrics)',
      artist: 'Random Lyrics Channel',
    );

    expect(official, 'tití me preguntó');
    expect(topic, official);
    expect(lyrics, official);
  });

  test('strips a trailing artist credit', () {
    expect(
      songDedupKey(title: 'Shape of You - Ed Sheeran', artist: 'Ed Sheeran'),
      songDedupKey(
        title: 'Shape of You (Official Video)',
        artist: 'Ed Sheeran',
      ),
    );
  });

  test('keeps different songs apart', () {
    expect(
      songDedupKey(title: 'Moscow Mule', artist: 'Bad Bunny'),
      isNot(songDedupKey(title: 'Ojitos Lindos', artist: 'Bad Bunny')),
    );
  });
}

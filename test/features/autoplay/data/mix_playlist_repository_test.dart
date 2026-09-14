import 'dart:convert';

import 'package:flow_music/features/autoplay/data/mix_playlist_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('mixPlaylistIdFor builds the auto-generated radio id', () {
    expect(mixPlaylistIdFor('dQw4w9WgXcQ'), 'RDdQw4w9WgXcQ');
  });

  test('parses the tracks and the continuation token of a mix', () {
    final body = jsonEncode({
      'name': 'Mix - Some song',
      'nextpage': 'opaque-token',
      'relatedStreams': [
        {
          'type': 'stream',
          'url': '/watch?v=first-track',
          'title': 'First track',
          'uploaderName': 'Some artist',
          'duration': 214,
        },
        {
          'type': 'stream',
          'url': '/watch?v=second-track',
          'title': 'Second track',
          'uploaderName': 'Another artist',
          'duration': 187,
        },
      ],
    });

    final page = parseMixPlaylistResponse(body, playlistId: 'RDseed');

    expect(page.playlistId, 'RDseed');
    expect(page.hasNextPage, isTrue);
    expect(page.nextPageToken, 'opaque-token');
    expect(page.tracks.map((track) => track.videoId), [
      'first-track',
      'second-track',
    ]);
    expect(page.tracks.first.displayText, 'First track');
    expect(page.tracks.first.channelTitle, 'Some artist');
    expect(page.tracks.first.duration, const Duration(seconds: 214));
    expect(page.tracks.first.thumbnailUrl, contains('first-track'));
  });

  test('drops repeats, non-streams and anything that is not song-length', () {
    final body = jsonEncode({
      'relatedStreams': [
        {
          'type': 'stream',
          'url': '/watch?v=song',
          'title': 'A song',
          'duration': 200,
        },
        // Mismo video otra vez.
        {
          'type': 'stream',
          'url': '/watch?v=song',
          'title': 'A song',
          'duration': 200,
        },
        // Canales y playlists que YouTube intercala en el mix.
        {'type': 'channel', 'url': '/channel/abc', 'title': 'A channel'},
        // Intro de 12 segundos y directo de 3 horas: no son canciones.
        {
          'type': 'stream',
          'url': '/watch?v=too-short',
          'title': 'Short clip',
          'duration': 12,
        },
        {
          'type': 'stream',
          'url': '/watch?v=too-long',
          'title': 'Endless live set',
          'duration': 10800,
        },
        // Sin duracion anotada: se deja pasar para no perder canciones validas.
        {
          'type': 'stream',
          'url': '/watch?v=unknown-length',
          'title': 'Unknown length',
        },
      ],
    });

    final page = parseMixPlaylistResponse(body, playlistId: 'RDseed');

    expect(page.tracks.map((track) => track.videoId), [
      'song',
      'unknown-length',
    ]);
    expect(page.hasNextPage, isFalse);
  });

  test('an unexpected payload yields an empty page instead of throwing', () {
    expect(parseMixPlaylistResponse('[]', playlistId: 'RDseed').isEmpty, isTrue);
    expect(
      parseMixPlaylistResponse('{"name":"Mix"}', playlistId: 'RDseed').isEmpty,
      isTrue,
    );
  });
}

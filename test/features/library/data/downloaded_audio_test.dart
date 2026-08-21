import 'package:flow_music/features/library/data/downloaded_audio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('preserves the muxed-stream marker in metadata', () {
    final download = DownloadedAudio(
      videoId: 'video-id',
      title: 'Song',
      author: 'Artist',
      thumbnailUrl: 'https://image.test/cover.jpg',
      filePath: '/downloads/video-id.mp4',
      downloadedAt: DateTime.utc(2026, 8, 21),
      hasVideoTrack: true,
    );

    final restored = DownloadedAudio.fromJson(download.toJson());

    expect(restored.mediaType, DownloadedMediaType.audio);
    expect(restored.hasVideoTrack, isTrue);
  });

  test('old metadata defaults to an audio-only stream', () {
    final restored = DownloadedAudio.fromJson({
      'videoId': 'video-id',
      'title': 'Song',
      'author': 'Artist',
      'thumbnailUrl': '',
      'filePath': '/downloads/video-id.m4a',
      'downloadedAt': '2026-08-21T00:00:00.000Z',
      'mediaType': 'audio',
    });

    expect(restored.hasVideoTrack, isFalse);
  });
}

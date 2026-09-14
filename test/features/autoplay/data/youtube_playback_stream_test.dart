import 'package:flow_music/features/autoplay/data/youtube_playback_stream.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

void main() {
  final audio = AudioOnlyStreamInfo.fromJson({
    'videoId': {'value': 'video-id'},
    'tag': 140,
    'url': 'https://media.test/audio',
    'container': {'name': 'mp4'},
    'size': {'totalBytes': 4},
    'bitrate': {'bitsPerSecond': 128000},
    'audioCodec': 'mp4a.40.2',
    'qualityLabel': 'medium',
    'fragments': <Map<String, dynamic>>[],
    'codec': 'audio/mp4',
    'audioTrack': null,
  });
  final smallMuxed = _muxed(tag: 18, bytes: 20, bitrate: 500000);
  final largeMuxed = _muxed(tag: 22, bytes: 40, bitrate: 1000000);
  final manifest = StreamManifest([audio, smallMuxed, largeMuxed]);

  test('Apple playback prefers the lowest-bitrate muxed stream', () {
    final selected = pickYoutubePlaybackStream(manifest, preferMuxed: true);

    expect(selected, same(smallMuxed));
  });

  test('other platforms retain the audio-only stream', () {
    final selected = pickYoutubePlaybackStream(manifest, preferMuxed: false);

    expect(selected, same(audio));
  });
}

MuxedStreamInfo _muxed({
  required int tag,
  required int bytes,
  required int bitrate,
}) {
  return MuxedStreamInfo.fromJson({
    'videoId': {'value': 'video-id'},
    'tag': tag,
    'url': 'https://media.test/muxed-$tag',
    'container': {'name': 'mp4'},
    'size': {'totalBytes': bytes},
    'bitrate': {'bitsPerSecond': bitrate},
    'audioCodec': 'mp4a.40.2',
    'videoCodec': 'avc1.42001E',
    'qualityLabel': '360p',
    'videoQuality': 'medium360',
    'videoResolution': {'width': 640, 'height': 360},
    'framerate': {'framesPerSecond': 30},
    'codec': 'video/mp4',
  });
}

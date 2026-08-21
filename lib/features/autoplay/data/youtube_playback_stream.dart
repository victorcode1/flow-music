import 'package:youtube_explode_dart/youtube_explode_dart.dart';

/// Selects a YouTube stream that the current platform can actually consume.
///
/// YouTube currently rejects the adaptive `audioOnly` URLs returned to the
/// package's clients with HTTP 403 unless a GVS PO token is supplied. Muxed
/// MP4 streams are still playable and AVPlayer can use their audio track, so
/// Apple platforms prefer the lowest-bitrate muxed stream to avoid downloading
/// unnecessary video data.
StreamInfo? pickYoutubePlaybackStream(
  StreamManifest manifest, {
  required bool preferMuxed,
}) {
  if (preferMuxed && manifest.muxed.isNotEmpty) {
    return manifest.muxed.sortByBitrate().last;
  }

  if (manifest.audioOnly.isNotEmpty) {
    final appleCompatible = manifest.audioOnly.where(
      (stream) =>
          stream.container == StreamContainer.mp4 ||
          stream.codec.subtype == 'mp4a.40.2',
    );
    return (appleCompatible.isEmpty ? manifest.audioOnly : appleCompatible)
        .withHighestBitrate();
  }

  if (manifest.muxed.isNotEmpty) {
    return manifest.muxed.sortByBitrate().last;
  }
  return null;
}

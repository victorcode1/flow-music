import 'package:video_player/video_player.dart';

VideoPlayerController createLocalVideoController(String filePath) {
  throw UnsupportedError(
    'Local video playback is not supported on this platform.',
  );
}

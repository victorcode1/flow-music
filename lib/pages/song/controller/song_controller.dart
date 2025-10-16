import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

final songController = ChangeNotifierProvider<SongController>((ref) {
  return SongController(ref: ref);
});

enum PlaybackMode { audio, video }

class SongController extends ChangeNotifier {
  Ref ref;
  final AudioPlayer _audioPlayer = AudioPlayer();
  VideoPlayerController? _videoPlayerController;

  PlaybackMode _currentMode = PlaybackMode.audio;
  bool _isLoading = false;
  String? _currentVideoId;
  Video? _videoInfo;

  PlaybackMode get currentMode => _currentMode;
  bool get isLoading => _isLoading;
  VideoPlayerController? get videoPlayerController => _videoPlayerController;
  Video? get videoInfo => _videoInfo;
  AudioPlayer get audioPlayer => _audioPlayer;

  SongController({required this.ref});

  Future<void> autoPlay({required String id}) async {
    if (_currentMode == PlaybackMode.audio) {
      await playAudio(id: id);
    } else {
      await playVideo(id: id);
    }
  }

  Future<void> playAudio({required String id}) async {
    try {
      _isLoading = true;
      notifyListeners();

      final extracted = extractVideoId(id);
      final videoId = extracted ?? id;
      _currentVideoId = videoId;

      debugPrint('Attempting to play YouTube audio: $videoId');

      var yt = YoutubeExplode();

      // Get video info
      _videoInfo = await yt.videos.get(videoId);

      var manifest = await yt.videos.streamsClient.getManifest(
        videoId,
        ytClients: [YoutubeApiClient.safari, YoutubeApiClient.androidVr],
      );
      if (manifest.audioOnly.isEmpty) {
        debugPrint('No audio streams available for video: $videoId');
        yt.close();
        _isLoading = false;
        notifyListeners();
        return;
      }
      var audioStream = manifest.audioOnly
          .where(
            (stream) =>
                stream.container == StreamContainer.mp4 ||
                stream.codec.subtype == 'mp4a.40.2',
          )
          .withHighestBitrate();
      yt.close();

      final audioUrl = audioStream.url.toString();
      debugPrint('Got audio URL: $audioUrl');

      // Dispose video player if exists
      await _videoPlayerController?.dispose();
      _videoPlayerController = null;

      await _audioPlayer.play(UrlSource(audioUrl));
      debugPrint('Audio player started');

      _isLoading = false;
      notifyListeners();
    } catch (e, stackTrace) {
      debugPrint('Error playing YouTube audio: $e');
      debugPrint('Stack trace: $stackTrace');
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> playVideo({required String id}) async {
    try {
      _isLoading = true;
      notifyListeners();

      final extracted = extractVideoId(id);
      final videoId = extracted ?? id;
      _currentVideoId = videoId;

      debugPrint('Attempting to play YouTube video: $videoId');

      var yt = YoutubeExplode();

      // Get video info
      _videoInfo = await yt.videos.get(videoId);

      var manifest = await yt.videos.streamsClient.getManifest(
        videoId,
        ytClients: [YoutubeApiClient.safari, YoutubeApiClient.androidVr],
      );

      // Get video and audio streams
      var videoStream = manifest.muxed.withHighestBitrate();
      yt.close();

      final videoUrl = videoStream.url.toString();
      debugPrint('Got video URL: $videoUrl');

      // Pause audio player
      await _audioPlayer.pause();

      // Dispose old video controller if exists
      try {
        await _videoPlayerController?.dispose();
        _videoPlayerController = null;
      } catch (e) {
        debugPrint('Error disposing previous video controller: $e');
      }

      // Initialize new video player
      try {
        _videoPlayerController = VideoPlayerController.networkUrl(
          Uri.parse(videoUrl),
        );

        await _videoPlayerController!.initialize();

        // Add error listener
        _videoPlayerController!.addListener(() {
          if (_videoPlayerController!.value.hasError) {
            debugPrint(
              'Video player error: ${_videoPlayerController!.value.errorDescription}',
            );
          }
        });

        await _videoPlayerController!.play();

        debugPrint('Video player started successfully');
      } catch (videoError) {
        debugPrint('Failed to initialize video player: $videoError');

        // Fallback to audio mode
        debugPrint('Falling back to audio mode...');
        _currentMode = PlaybackMode.audio;
        _videoPlayerController = null;

        // Play audio instead
        await playAudio(id: id);
        return;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e, stackTrace) {
      debugPrint('Error playing YouTube video: $e');
      debugPrint('Stack trace: $stackTrace');

      // Fallback to audio mode on any error
      _currentMode = PlaybackMode.audio;
      _videoPlayerController = null;
      _isLoading = false;
      notifyListeners();

      // Try to play audio as fallback
      try {
        await playAudio(id: id);
      } catch (audioError) {
        debugPrint('Audio fallback also failed: $audioError');
      }
    }
  }

  void switchMode(PlaybackMode mode) {
    if (_currentMode != mode) {
      _currentMode = mode;
      notifyListeners();

      if (_currentVideoId != null) {
        autoPlay(id: _currentVideoId!);
      }
    }
  }

  void setSourceForId({required String id}) async {
    try {
      final extracted = extractVideoId(id);
      final videoId = extracted ?? id;

      var yt = YoutubeExplode();
      var manifest = await yt.videos.streamsClient.getManifest(
        videoId,
        ytClients: [YoutubeApiClient.safari, YoutubeApiClient.androidVr],
      );
      if (manifest.audioOnly.isEmpty) {
        debugPrint('No audio streams available for video: $videoId');
        yt.close();
        return;
      }
      var audioStream = manifest.audioOnly.withHighestBitrate();
      yt.close();

      await _audioPlayer.setSourceUrl(audioStream.url.toString());
    } catch (e) {
      debugPrint('Error setting source: $e');
    }
  }

  void playForId({required String id}) async {
    await autoPlay(id: id);
  }

  String? extractVideoId(String url) {
    final regExp = RegExp(
      r'(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})',
    );
    final match = regExp.firstMatch(url);
    return match?.group(1);
  }

  void playListSong({String? playListId}) {
    if (playListId != null) {
      debugPrint('Playlist ID: $playListId');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }
}

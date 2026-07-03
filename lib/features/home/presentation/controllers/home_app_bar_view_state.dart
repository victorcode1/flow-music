import 'package:flow_music/core/consts/enums.dart';
import 'package:flow_music/features/library/data/downloaded_audio.dart';
import 'package:flow_music/features/song/presentation/controllers/song_controller.dart';
import 'package:flutter/foundation.dart';

/// Estado derivado que necesita la vista del app bar de home.
@immutable
class HomeAppBarViewState {
  final DownloadedAudio? playlistItem;
  final DownloadedAudio nowPlayingItem;
  final bool hasNowPlaying;
  final String titleText;

  const HomeAppBarViewState({
    required this.playlistItem,
    required this.nowPlayingItem,
    required this.hasNowPlaying,
    required this.titleText,
  });

  factory HomeAppBarViewState.fromSongState({
    required SongController songState,
    required String? nowPlayingTitle,
    required bool showNowPlayingTitle,
  }) {
    final playlistItem = songState.currentPlaylistItem;
    final hasNowPlaying =
        showNowPlayingTitle &&
        nowPlayingTitle != null &&
        nowPlayingTitle.isNotEmpty;

    final nowPlayingItem =
        playlistItem ??
        DownloadedAudio(
          videoId: songState.currentVideoId ?? '',
          title: songState.displayTitle ?? nowPlayingTitle ?? '',
          author: songState.displayAuthor ?? '',
          thumbnailUrl: songState.displayThumbnailUrl ?? '',
          filePath: '',
          downloadedAt: DateTime.now(),
          mediaType: songState.currentMode == PlaybackMode.video
              ? DownloadedMediaType.video
              : DownloadedMediaType.audio,
        );

    return HomeAppBarViewState(
      playlistItem: playlistItem,
      nowPlayingItem: nowPlayingItem,
      hasNowPlaying: hasNowPlaying,
      titleText: hasNowPlaying ? nowPlayingTitle : Variables.name.value,
    );
  }
}

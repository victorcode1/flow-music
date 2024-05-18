import 'package:audioplayers_platform_interface/src/api/player_state.dart';
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/domain/sources.dart';
import 'package:flow_music/provider/audio_player_controller.dart';
import 'package:flow_music/provider/play_song_id.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final songController = ChangeNotifierProvider<SongController>((ref) {
  return SongController(ref: ref);
});

class SongController extends ChangeNotifier {
  ChangeNotifierProviderRef ref;
  late AudioPlayerProvider audio;
  SongController({required this.ref}) {
    audio = ref.read(audioPlayerProviderProvider.notifier);
  }

  AsyncValue result({required String data}) =>
      ref.watch(playSongIdProvider(songId: data)).when(
            data: (data) => AsyncValue.data(data),
            error: (error, stack) => AsyncValue.error(error, stack),
            loading: () => const AsyncValue.loading(),
          );

  setSource({required UrlSource source}) {
    audio.setSource(source: source);
  }

  play({required UrlSource source}) {
    audio.play(source: source);
  }

  String urlSong({required data}) {
    data as SongIdResponde;
    final urlSong = data.streamingData?.adaptiveFormats
            ?.firstWhere((element) =>
                element.mimeType == "audio/mp4; codecs=\"mp4a.40.5\"")
            .url ??
        '';
    return urlSong;
  }

  autoPlay({required String data}) {
    if (data.isNotEmpty) {
      audio.setSource(source: UrlSource(data));
      audio.play(source: UrlSource(data));
    }
  }

  playListSong({String? playListId}) {
    if (playListId != null) {
      switch (audio.status()) {
        case PlayerState.stopped:
          print('playListId stopped: $playListId');

          break;
        case PlayerState.playing:
          print('playListId playing: $playListId');
          ref.watch(playSongIdProvider(songId: playListId)).when(
                data: (data) =>
                    audio.play(source: UrlSource(urlSong(data: data))),
                error: (error, stack) => AsyncValue.error(error, stack),
                loading: () => const AsyncValue.loading(),
              );
          break;
        case PlayerState.paused:
          print('playListId paused: $playListId');
          break;
        case PlayerState.completed:
          print('playListId completed: $playListId');

          break;
        case PlayerState.disposed:
          print('playListId disposed: $playListId');
          break;
      }
    }
  }
}

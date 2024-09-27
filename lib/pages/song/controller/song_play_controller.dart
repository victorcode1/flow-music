import 'dart:async';
import 'dart:io';

import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/core/sources.dart' as sources;
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/domain/repository/geneal_repo.dart';
import 'package:flow_music/pages/shared/seek_bar/seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../datasource/model/load_play_list.dart';

final songPlayController =
    ChangeNotifierProvider.autoDispose<SongPlayController>((ref) {
  final implement = ref.read(mainController).implement;
  return SongPlayController(ref: ref, implement: implement);
});

class SongPlayController extends ChangeNotifier {
  final ChangeNotifierProviderRef<SongPlayController> ref;
  String _idSong = '';
  final GenealRepo implement;
  int _songIndex = 46;

  final streamController = StreamController<SongIdResponde>.broadcast();

  SongPlayController({required this.ref, required this.implement});

  Future<void> autoPlay({required String data}) async {
    if (data.isNotEmpty) {
      _songIndex = 46;
      await implement.audioRepository.play(source: sources.UrlSource(data));
    }
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

  Future<SongIdResponde?> getSong({required String data}) async {
    final fdata = await implement.httpRepo.songResult.songSerch(songId: data);
    if (fdata != null) {
      streamController.add(fdata);
    }

    return fdata;
  }

  Future<void> setAudioStatePaused() async {
    await implement.audioRepository.resume();
  }

  void back({required BuildContext context}) {
    GoRouter.of(context).pop();
  }

  void search(
      {required BuildContext context, required SearchDelegate delegate}) {
    showSearch(context: context, delegate: delegate);
  }

  Stream<PlayerState> get statusStream =>
      implement.audioRepository.statusStream;

  Stream<PositionData> positionDataStream({LoadPayListRessponse? data}) {
    return Rx.combineLatest3<Duration?, Duration?, Duration?, PositionData>(
        implement.audioRepository.positionStream,
        implement.audioRepository.bufferedPositionStream,
        implement.audioRepository.durationStream,
        (position, bufferedPosition, duration) {
      if (duration != null && position != null && bufferedPosition != null) {
        final effectiveDuration =
            Platform.isIOS || Platform.isMacOS ? duration ~/ 2 : duration;
        final effectivePosition =
            position < effectiveDuration ? position : effectiveDuration;
        if (effectiveDuration == effectivePosition) {
          debugPrint('stop');
          //pause

          setAudioStateStopped();
          nextSong(data: data);
        }
      }

      return PositionData(
          position!, bufferedPosition!, duration ?? Duration.zero);
    });
  }

  Future<LoadPayListRessponse> loadPlayList({required String idSong}) async {
    final result = await implement.httpRepo.loadParamsPlayList
        .loadPlayList(songId: idSong);

    final playlistId = result
        .contents
        ?.singleColumnMusicWatchNextResultsRenderer
        ?.tabbedRenderer
        ?.watchNextTabbedResultsRenderer
        ?.tabs
        ?.first
        .tabRenderer
        ?.content
        ?.musicQueueRenderer
        ?.content
        ?.playlistPanelRenderer
        ?.contents?[1]
        .automixPreviewVideoRenderer
        ?.content
        ?.automixPlaylistVideoRenderer
        ?.navigationEndpoint
        ?.watchPlaylistEndpoint
        ?.playlistId;

    final params = result
        .contents
        ?.singleColumnMusicWatchNextResultsRenderer
        ?.tabbedRenderer
        ?.watchNextTabbedResultsRenderer
        ?.tabs
        ?.first
        .tabRenderer
        ?.content
        ?.musicQueueRenderer
        ?.content
        ?.playlistPanelRenderer
        ?.contents?[1]
        .automixPreviewVideoRenderer
        ?.content
        ?.automixPlaylistVideoRenderer
        ?.navigationEndpoint
        ?.watchPlaylistEndpoint
        ?.params;

    if (playlistId == null) {
      throw Exception('No se encontro la lista de reproduccion');
    }
    if (params == null) {
      throw Exception('No se encontro la lista de reproduccion');
    }

    final data = implement.httpRepo.loadPlayList
        .loadPlayList(songId: idSong, params: params, playlistId: playlistId);

    return data;
  }

  Future<void> setAudioPause() async {
    await implement.audioRepository.pause();
  }

  Future<void> seek({required Duration duration}) async {
    await implement.audioRepository.seek(duration: duration);
  }

  Future prevSong({LoadPayListRessponse? data}) async {
    if (data != null) {
      print(_songIndex);

      if (_songIndex >= 1) {
        _songIndex--;
      } else if (_songIndex == 0) {
        _songIndex = 0;
      }
      final idSong = data
          .contents
          ?.singleColumnMusicWatchNextResultsRenderer
          ?.tabbedRenderer
          ?.watchNextTabbedResultsRenderer
          ?.tabs
          ?.first
          .tabRenderer
          ?.content
          ?.musicQueueRenderer
          ?.content
          ?.playlistPanelRenderer
          ?.contents?[_songIndex]
          .playlistPanelVideoRenderer
          ?.videoId;
      if (idSong != null) {
        implement.audioRepository.stop();
        implement.httpRepo.songResult.songSerch(songId: idSong).then((data) {
          if (data != null) {
            streamController.add(data);
            implement.audioRepository
                .play(source: sources.UrlSource(urlSong(data: data)));
          }
        });
      }
      print(_songIndex);
    }
  }

  Future<void> setAudioStateStopped() async {
    await implement.audioRepository.stop();
  }

  Future<void> replay() async {
    await implement.audioRepository.replay();
  }

  Future<void> nextSong({LoadPayListRessponse? data}) async {
    if (data != null) {
      print(_songIndex);

      if (_songIndex < 49) {
        _songIndex++;
      } else if (_songIndex == 49) {
        _songIndex = 0;
      }
      final idSong = data
          .contents
          ?.singleColumnMusicWatchNextResultsRenderer
          ?.tabbedRenderer
          ?.watchNextTabbedResultsRenderer
          ?.tabs
          ?.first
          .tabRenderer
          ?.content
          ?.musicQueueRenderer
          ?.content
          ?.playlistPanelRenderer
          ?.contents?[_songIndex]
          .playlistPanelVideoRenderer
          ?.videoId;

      print(_songIndex);
      if (idSong != null) {
        await implement.audioRepository.stop();
        final data =
            await implement.httpRepo.songResult.songSerch(songId: idSong);

        if (data != null) {
          streamController.add(data);
          await implement.audioRepository
              .play(source: sources.UrlSource(urlSong(data: data)));
        }
      }
    }
  }

  void idSong({String? idSong}) {
    if (idSong != null) {
      _idSong = idSong;
    }
  }

  String get getIdSong => _idSong;

  void changeVieo({required String videoId}) {}

  void setStatus({required PlayerState data, LoadPayListRessponse? playList}) {}
}

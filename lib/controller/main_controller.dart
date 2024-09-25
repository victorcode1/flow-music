import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/controller/interface/controller_contract.dart';
import 'package:flow_music/core/sources.dart' as sources;
import 'package:flow_music/datasource/model/list_search_result.dart'
    as list_search;
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/domain/implements/general.dart';
import 'package:flow_music/pages/contract/contract.dart';
import 'package:flow_music/pages/shared/list_search_secondary/controller/list_song_controller.dart';
import 'package:flow_music/pages/shared/seek_bar/seek_bar.dart';
import 'package:flow_music/settings/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

final mainController =
    ChangeNotifierProvider<MainController>((ref) => MainController(ref: ref));

class MainController extends ChangeNotifier implements ControllerContract {
  ChangeNotifierProviderRef<MainController> ref;
  late final GeneralImplement _generalImplement;
  late final ListSongController _listSongController;
  Contract? iO;
  GlobalKey<ScaffoldMessengerState> scaffoldMessage =
      GlobalKey<ScaffoldMessengerState>();

  MainController({required this.ref})
      : _generalImplement = GeneralImplement(),
        _listSongController = ListSongController();

  Stream<User?> get user => _generalImplement.userRepository.user;

  @override
  GoRouter get router => ref.watch(routeProvider);

  @override
  void search(
      {required BuildContext context, required SearchDelegate delegate}) {
    showSearch(context: context, delegate: delegate);
  }

  @override
  Future<void> autoPlay({required String data}) async {
    if (data.isNotEmpty) {
      //await _domain.setSource(source: sources.UrlSource(data));
      await _generalImplement.audioRepository
          .play(source: sources.UrlSource(data));
    }
  }

  @override
  Future<void> setAudioStateDetached() async {
    return await _generalImplement.audioRepository.dispose();
  }

  @override
  Future<void> setAudioStatePaused() async {
    await _generalImplement.audioRepository.resume();
  }

  @override
  Future<void> setAudioPause() async {
    await _generalImplement.audioRepository.pause();
  }

  @override
  Future<void> setSource({required sources.UrlSource source}) async {
    await _generalImplement.audioRepository.setSource(source: source);
    notifyListeners();
  }

  @override
  Stream<PlayerState> get statusStream =>
      _generalImplement.audioRepository.statusStream;

  @override
  Stream<Duration?> get stremDuracion =>
      _generalImplement.audioRepository.stremDuracion;

  @override
  Stream<Duration?> get stremPosiscion =>
      _generalImplement.audioRepository.stremPosiscion;

  @override
  String urlSong({required data}) {
    data as SongIdResponde;
    final urlSong = data.streamingData?.adaptiveFormats
            ?.firstWhere((element) =>
                element.mimeType == "audio/mp4; codecs=\"mp4a.40.5\"")
            .url ??
        '';
    return urlSong;
  }

  @override
  Future<void> logAuth() async {
    return await _generalImplement.userRepository.logAuth();
  }

  void initHome({required Contract iO}) {
    this.iO = iO;
  }

  @override
  Future<list_search.ListSearchSongResult?> getListSong({required data}) async {
    return await _listSongController.getListSong(data: data);
  }

  @override
  dispose() async {
    debugPrint('Dispose MainController');
    await _generalImplement.audioRepository.dispose();
    super.dispose();
  }

  @override
  StreamController<(StreamController<Duration>, StreamController<Duration>)>
      get streamController =>
          _generalImplement.audioRepository.streamController;

  @override
  int count({required list_search.ListSearchSongResult data}) {
    return _listSongController.count(data: data);
  }

  @override
  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration?, Duration?, Duration?, PositionData>(
          _generalImplement.audioRepository.positionStream,
          _generalImplement.audioRepository.bufferedPositionStream,
          _generalImplement.audioRepository.durationStream,
          (position, bufferedPosition, duration) {
        if (duration != null && position != null && bufferedPosition != null) {
          final effectiveDuration =
              Platform.isIOS || Platform.isMacOS ? duration ~/ 2 : duration;
          final effectivePosition =
              position < effectiveDuration ? position : effectiveDuration;
          if (effectiveDuration == effectivePosition) {
            debugPrint('stop');
            //pause

            setAudioPause();
          }
        }

        return PositionData(
            position!, bufferedPosition!, duration ?? Duration.zero);
      });

  @override
  void escuchar(
      {required list_search.ListSearchSongResult data,
      required BuildContext context,
      required int index}) {
    _listSongController.escuchar(data: data, context: context, index: index);
  }

  @override
  String imageRes(
      {required list_search.ListSearchSongResult data, required int index}) {
    return _listSongController.imageRes(data: data, index: index);
  }

  @override
  String? subtitle(
      {required list_search.ListSearchSongResult data, required int index}) {
    return _listSongController.subtitle(data: data, index: index);
  }

  @override
  String dataRes(
      {required list_search.ListSearchSongResult data, required int index}) {
    return _listSongController.dataRes(data: data, index: index);
  }

  @override
  Future<Map<String, String>> extra({required String data}) {
    return _listSongController.extra(data: data);
  }

  @override
  Future<SongIdResponde?> getSong({required String data}) async {
    return await _generalImplement.resultSong(songId: data);
  }

  @override
  Future<void> setAudioStateStopped() async {
    await _generalImplement.audioRepository.stop();
  }

  @override
  Future<void> seek({required Duration duration}) async {
    await _generalImplement.audioRepository.seek(duration: duration);
  }

  changeVieo({required String videoId}) {}

  @override
  void init() {
    _generalImplement.audioRepository.init();
  }

  @override
  Future<void> replay() async {
    await _generalImplement.audioRepository.replay();
  }

  @override
  void playRadio({required sources.UrlSource source}) {
    _generalImplement.audioRepository.playRadio(source: source);
  }
}

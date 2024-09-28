import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart' as audio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/controller/interface/controller_contract.dart';
import 'package:flow_music/core/sources.dart' as sources;
import 'package:flow_music/domain/implements/general.dart';
import 'package:flow_music/domain/repository/geneal_repo.dart';
import 'package:flow_music/pages/components/appbar/controller/app_bar_con.dart';
import 'package:flow_music/pages/contract/home_view_inter_face.dart';
import 'package:flow_music/pages/shared/seek_bar/seek_bar.dart';
import 'package:flow_music/settings/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

final mainController =
    ChangeNotifierProvider<MainController>((ref) => MainController(ref: ref));

class MainController extends ChangeNotifier implements ControllerContract {
  ChangeNotifierProviderRef<MainController> ref;
  late HomeViewInterFace _iO;
  Map<String, String> _data = {};

  final focusNodePrincipal = FocusNode();

  double _extendSize = 0;

  PageController pageController = PageController(initialPage: 0);

  MainController({required this.ref});

  @override
  Stream<User?> get user => implement.userRepository.user;

  @override
  GoRouter get router => ref.watch(routeProvider);

  @override
  Future<void> setAudioStateDetached() async {
    return await implement.audioRepository.dispose();
  }

  @override
  Future<void> setAudioStatePaused() async {
    await implement.audioRepository.resume();
  }

  void search(
      {required BuildContext context, required SearchDelegate delegate}) {
    showSearch(context: context, delegate: delegate);
  }

  @override
  Future<void> setAudioPause() async {
    await implement.audioRepository.pause();
  }

  @override
  Future<void> setSource({required sources.UrlSource source}) async {
    await implement.audioRepository.setSource(source: source);
    notifyListeners();
  }

  Stream<PlayerState> get statusStream =>
      implement.audioRepository.statusStream;

  @override
  Stream<Duration?> get stremDuracion =>
      implement.audioRepository.stremDuracion;

  @override
  Stream<Duration?> get stremPosiscion =>
      implement.audioRepository.stremPosiscion;

  @override
  Future<void> logAuth() async {
    return await implement.userRepository.logAuth();
  }

  void initHome({required HomeViewInterFace iO}) {
    _iO = iO;
  }

  @override
  dispose() async {
    debugPrint('Dispose MainController');
    await implement.audioRepository.dispose();
    super.dispose();
  }

  @override
  StreamController<(StreamController<Duration>, StreamController<Duration>)>
      get streamController => implement.audioRepository.streamController;

  @override
  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration?, Duration?, Duration?, PositionData>(
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

            setAudioPause();
          }
        }

        return PositionData(
            position!, bufferedPosition!, duration ?? Duration.zero);
      });

  @override
  Future<void> setAudioStateStopped() async {
    await implement.audioRepository.stop();
  }

  @override
  Future<void> seek({required Duration duration}) async {
    await implement.audioRepository.seek(duration: duration);
  }

  changeVieo({required String videoId}) {}

  @override
  void init() {
    implement.audioRepository.init();
    _requestPermissions();
  }

  @override
  Future<void> replay() async {
    await implement.audioRepository.replay();
  }

  @override
  void playRadio({required sources.UrlSource source}) {
    implement.audioRepository.playRadio(source: source);
  }

  Future<void> _requestPermissions() async {
    var status = await Permission.photos.status;
    if (!status.isGranted) {
      await Permission.photos.request();
    }
  }

  @override
  GenealRepo get implement => GeneralImplement();

  double get extendSize => _extendSize;

  Stream<audio.PlayerState> get statusRadio =>
      implement.audioRepository.statusRadios;

  set extendSize(double value) {
    _extendSize = value;
    notifyListeners();
  }

  void retunrSongView({required BuildContext context}) {
    // context.pushNamed(Rutas.playSong.name,
    //     queryParameters: {'idSong': null, 'playListId': null});

    pageController.jumpToPage(1);
    //notifyListeners();
  }

  void listenerKey({required KeyEvent value}) {
    ref.read(appBarController).setFocusNode = value;
  }

  Widget viewPlay(Widget Function(Map<String, String> data) builder) {
    return builder(_data);
  }

  void buildView({Map<String, String>? data}) {
    if (data != null) {
      _data = data;
    }
    //  final viewPlay = _iO.songPlay(data: data);
    pageController.jumpToPage(1);
    notifyListeners();
  }

  void backReturn() {
    pageController.jumpToPage(0);
  }

  Future saveUser({User? user}) async {
    if (user != null) {
      await implement.dataRepository.data.saveUser(user: user);
    }
  }

  void updateLogAuthData() {
    implement.dataRepository.data.logAuth();
  }
}

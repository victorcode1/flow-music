import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/controller/interface/controller_contract.dart';
import 'package:flow_music/core/sources.dart' as sources;
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/domain/implements/general.dart';
import 'package:flow_music/domain/repository/geneal_repo.dart';
import 'package:flow_music/pages/contract/contract.dart';
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

  void initHome({required Contract iO}) {}

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
  }

  @override
  Future<void> replay() async {
    await implement.audioRepository.replay();
  }

  @override
  void playRadio({required sources.UrlSource source}) {
    implement.audioRepository.playRadio(source: source);
  }

  @override
  GenealRepo get implement => GeneralImplement();




}

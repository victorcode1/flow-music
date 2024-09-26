import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/core/sources.dart' as sources;
import 'package:flow_music/domain/repository/geneal_repo.dart';
import 'package:flow_music/pages/shared/seek_bar/seek_bar.dart';
import 'package:go_router/go_router.dart';

abstract interface class ControllerContract {
  GenealRepo get implement;
  Stream<User?> get user;
  GoRouter get router;
  Stream<PositionData> get positionDataStream;
  StreamController<(StreamController<Duration>, StreamController<Duration>)>
      get streamController;

  Stream<Duration?> get stremPosiscion;
  Stream<Duration?> get stremDuracion;
  Future<void> setAudioPause();
  Future<void> setAudioStatePaused();
  Future<void> setAudioStateDetached();

  void playRadio({required sources.UrlSource source});
  Future<void> replay();
  void init();
  Future<void> seek({required Duration duration});
  Future<void> setAudioStateStopped();
  Future<void> setSource({required sources.UrlSource source});
  Future<void> logAuth();
}

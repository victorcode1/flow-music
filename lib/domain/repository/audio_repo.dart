import 'dart:async';

import 'package:audioplayers/audioplayers.dart' as audio;
import 'package:flow_music/core/sources.dart' as sources;
import 'package:just_audio/just_audio.dart';

abstract class AudioRepo {
  void playRadio({required sources.UrlSource source});
  Future<void> replay();
  Future<void> seek({required Duration duration});
  Future<void> stop();
  Future<void> setSource({required sources.UrlSource source});
  Future<void> play({required sources.UrlSource source});
  Future<void> pause();
  Future<void> resume();
  Future<void> dispose();
  void init();
  StreamController<(StreamController<Duration>, StreamController<Duration>)>
      get streamController;
  Stream<PlayerState> get statusStream;
  Stream<Duration?> get stremDuracion;
  Stream<Duration?> get stremPosiscion;
  Stream<Duration?> get positionStream;
  Stream<Duration?> get bufferedPositionStream;
  Stream<Duration?> get durationStream;

  Stream<audio.PlayerState> get statusRadios;
}

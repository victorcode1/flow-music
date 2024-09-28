import 'dart:async';

import 'package:audioplayers/audioplayers.dart' as audio;
import 'package:flow_music/core/sources.dart' as sources;
import 'package:flow_music/datasource/services/audio/audio_manger_audiop.dart';
import 'package:flow_music/datasource/services/audio/audio_manger_justa.dart';
import 'package:flow_music/domain/repository/audio_repo.dart';
import 'package:just_audio/just_audio.dart';

class AudioImp extends AudioRepo {
  final JustAudioManager _controllerManager;
  final AudioManagerAudioPlayer _streamingManager;
  AudioImp(
      {required JustAudioManager controllerManager,
      required AudioManagerAudioPlayer streamingManager})
      : _controllerManager = controllerManager,
        _streamingManager = streamingManager;

  @override
  Stream<PlayerState> get statusStream => _controllerManager.statusStream;

  @override
  Stream<Duration?> get stremDuracion => _controllerManager.streamDuracion;

  @override
  Stream<Duration?> get stremPosiscion => _controllerManager.streamPosicion;

  @override
  StreamController<(StreamController<Duration>, StreamController<Duration>)>
      get streamController => _controllerManager.streamController;

  @override
  Stream<Duration?> get positionStream => _controllerManager.streamPosicion;

  @override
  Stream<Duration?> get bufferedPositionStream =>
      _controllerManager.streamDuracion;

  @override
  Stream<Duration?> get durationStream => _controllerManager.streamDuracion;

  @override
  Future<void> dispose() {
    return _controllerManager.dispose();
  }

  @override
  Future<void> resume() {
    return _controllerManager.resume();
  }

  @override
  Future<void> pause() {
    return _controllerManager.pause();
  }

  @override
  Future<void> play({required sources.UrlSource source}) {
    return _controllerManager.play(
        source: AudioSource.uri(Uri.parse(source.url)));
  }

  @override
  Future<void> setSource({required sources.UrlSource source}) {
    return _controllerManager.play(
        source: AudioSource.uri(Uri.parse(source.url)));
  }

  @override
  Future<void> stop() {
    return _controllerManager.stopAudio();
  }

  @override
  Future<void> seek({required Duration duration}) {
    return _controllerManager.seek(duration: duration);
  }

  @override
  void init() {
    _controllerManager.init();
  }

  @override
  Future<void> replay() {
    return _controllerManager.replay();
  }

  @override
  void playRadio({required sources.UrlSource source}) {
    _streamingManager.play(source: source);
  }
  
  @override
 
  Stream<audio.PlayerState> get statusRadios =>  _streamingManager.statusStream;

   
}

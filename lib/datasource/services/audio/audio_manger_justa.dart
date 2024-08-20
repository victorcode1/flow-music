import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioManagerJustAudio {
  late AudioPlayer _audioPlayer;
  Duration? _duration;
  Duration? _position;
  final StreamController<Duration> _durationSubscription =
      StreamController<Duration>.broadcast();
  final StreamController<Duration> _positionSubscription =
      StreamController<Duration>.broadcast();

  final StreamController<
          (StreamController<Duration>, StreamController<Duration>)>
      _streamController = StreamController<
          (StreamController<Duration>, StreamController<Duration>)>.broadcast();
  StreamController? _playerCompleteSubscription;
  StreamController? _playerStateChangeSubscription;

  // Singleton
  static final AudioManagerJustAudio _instance =
      AudioManagerJustAudio._internal();

  factory AudioManagerJustAudio() => _instance;
  AudioManagerJustAudio._internal() {
    _audioPlayer = AudioPlayer();

    debugPrint('AudioPlayer created ${_audioPlayer.playerState}');
  }

  StreamController<(StreamController<Duration>, StreamController<Duration>)>
      get streamController => _streamController;

  Stream<PlayerState> get statusStream => _audioPlayer.playerStateStream;

  Stream<Duration?> get streamDuracion => _audioPlayer.durationStream;

  Stream<Duration?> get streamPosicion => _audioPlayer.positionStream;

  Future<void> play({required AudioSource source}) async {
    debugPrint('setSource ${_audioPlayer.playerState}');
    if (_audioPlayer.playing) await _audioPlayer.stop();
    await _audioPlayer.setAudioSource(source);
    await _audioPlayer.play();
  }

  Future<void> dispose() async {
    debugPrint('dispose ${_audioPlayer.playerState}');

    _durationSubscription.close();
    _positionSubscription.close();
    _playerCompleteSubscription?.close();
    _playerStateChangeSubscription?.close();
    _streamController.close();
    await _audioPlayer.dispose();
  }

  Future<void> resume() async {
    if (_audioPlayer.playing) {
      return await _audioPlayer.pause();
    }
    return await _audioPlayer.play();
  }

  Future<void> pause() async {
    if (_audioPlayer.playing) {
      return await _audioPlayer.pause();
    }
    return await _audioPlayer.play();
  }

  Future<void> stopAudio() async {
    return await _audioPlayer.stop();
  }

  Future<void> seek({required Duration duration}) async {
    await _audioPlayer.seek(duration);
  }
}

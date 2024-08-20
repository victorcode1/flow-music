import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioManagerAudioPlayer {
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
  static final AudioManagerAudioPlayer _instance =
      AudioManagerAudioPlayer._internal();

  factory AudioManagerAudioPlayer() => _instance;
  AudioManagerAudioPlayer._internal() {
    _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);

    debugPrint('AudioPlayer created ${_audioPlayer.state}');
  }

  Stream<PlayerState> get statusPlay => _audioPlayer.onPlayerStateChanged;

  Stream<Duration> get streamDuracion => _audioPlayer.onDurationChanged;
  Stream<Duration> get streamPosicion => _audioPlayer.onPositionChanged;

  StreamController<(StreamController<Duration>, StreamController<Duration>)>
      get streamController => _streamController;

  double get valueSlider => (_position != null &&
          _duration != null &&
          _position!.inMilliseconds > 0 &&
          _position!.inMilliseconds < _duration!.inMilliseconds)
      ? _position!.inMilliseconds / _duration!.inMilliseconds
      : 0.0;

  Future<void> play({required Source source}) async {
    debugPrint('setSource ${_audioPlayer.state}');
    await _audioPlayer.stop();
    await _audioPlayer.play(source);
    _duration = await _audioPlayer.getDuration();
    _position = await _audioPlayer.getCurrentPosition();
    _initStreams();
  }

  Future<void> dispose() async {
    debugPrint('dispose ${_audioPlayer.state}');

    _durationSubscription.close();
    _positionSubscription.close();
    _playerCompleteSubscription?.close();
    _playerStateChangeSubscription?.close();
    _streamController.close();
    await _audioPlayer.dispose();
  }

  Future<void> resume() async {
    return await _audioPlayer.resume();
  }

  Future<void> pause() async {
    if (_audioPlayer.state == PlayerState.playing) {
      return await _audioPlayer.pause();
    }
    return await _audioPlayer.resume();
  }

  Future<void> stopAudio() async {
    return await _audioPlayer.stop();
  }

  void _initStreams() {
    _audioPlayer.onDurationChanged.listen((duration) {
      _duration = duration;
      _durationSubscription.add(duration);
    });

    _audioPlayer.onPositionChanged.listen((p) {
      _position = p;
      _positionSubscription.add(p);
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      _audioPlayer.stop();
      _position = Duration.zero;
    });

    _audioPlayer.onPlayerStateChanged.listen((state) {
      _playerStateChangeSubscription?.add(state);
    });

    _streamController.add((_durationSubscription, _positionSubscription));
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioManaget {
  AudioPlayer _audioPlayer;
  //singleton
  static final AudioManaget _instance = AudioManaget._internal();
  factory AudioManaget() => _instance;
  AudioManaget._internal() : _audioPlayer = AudioPlayer() {
    debugPrint('AudioPlayer created');
    _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
  }

  PlayerState get status => _audioPlayer.state;

  Future<void> play({required Source source}) async {
    await _audioPlayer.play(source);
  }

  Future<void> dispose() async {
    return await _audioPlayer.dispose();
  }

  Future<void> resume() async {
    return await _audioPlayer.resume();
  }

  Future<void> pause() async {
    return await _audioPlayer.pause();
  }

  Future<void> setSource({required Source source}) async {
    return await source.setOnPlayer(_audioPlayer);
  }
}

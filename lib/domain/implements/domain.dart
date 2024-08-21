import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/datasource/model/search_result.dart';
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/datasource/services/audio/audio_manger_audiop.dart';
import 'package:flow_music/datasource/services/audio/audio_manger_justa.dart';
import 'package:flow_music/datasource/services/firebase/auth/auth_fire.dart';
import 'package:flow_music/datasource/services/firebase/core/fire_core.dart';
import 'package:flow_music/datasource/services/http/search_query.dart';
import 'package:flow_music/datasource/services/http/song_result.dart';
import 'package:flow_music/domain/sources.dart' as sources;
import 'package:just_audio/just_audio.dart';

class Domain {
  late AudioManagerJustAudio _audio;
  late AudioManagerAudioPlayer _audioManagerAudioPlayer;
  late AuthFire _auth;
  late FireCore fireCore;

  Domain() {
    _audio = AudioManagerJustAudio();
    _auth = AuthFire();
    _audioManagerAudioPlayer = AudioManagerAudioPlayer();
  }

  Stream<PlayerState> get statusPlay => _audio.statusStream;

  Stream<User?> get user => _auth.user;

  Stream<Duration?> get stremDuracion => _audio.streamDuracion;
  Stream<Duration?> get stremPosiscion => _audio.streamPosicion;

  StreamController<(StreamController<Duration>, StreamController<Duration>)>
      get streamController => _audio.streamController;

  Stream<Duration?> get positionStream => _audio.streamPosicion;

  Stream<Duration?> get bufferedPositionStream => _audio.streamDuracion;

  Stream<Duration?> get durationStream => _audio.streamDuracion;

  Future<void> dispose() async {
    return await _audio.dispose();
  }

  Future<void> resume() async {
    return await _audio.resume();
  }

  Future<void> pause() async {
    return await _audio.setPause();
  }

  Future<void> play({required sources.UrlSource source}) async {
    return await _audio.play(source: AudioSource.uri(Uri.parse(source.url)));
  }

  Future<void> setSource({required sources.UrlSource source}) async {
    return await _audio.play(source: AudioSource.uri(Uri.parse(source.url)));
  }

  Future<void> logAuth() async {
    return await _auth.logAuth();
  }

  Future<SearchResult?> getListResult({required String query}) async {
    SearchQuery searchQuery = SearchQuery();
    return await searchQuery.getListSearch(query: query);
  }

  Future<SongIdResponde?> resultSong({required String songId}) async {
    SongResult songResult = SongResult();
    return await songResult.songSerch(songId: songId);
  }

  Future<void> stop() async {
    return await _audio.stopAudio();
  }

  Future<void> seek({required Duration duration}) async {
    await _audio.seek(duration: duration);
  }

  void init() {
    _audio.init();
  }

  Future<void> replay() async {
    await _audio.replay();
  }

  void playRadio({required sources.UrlSource source}) {
    _audioManagerAudioPlayer.play(source: source);
  }
}

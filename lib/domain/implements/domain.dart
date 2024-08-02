import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/datasource/services/audio/implements_repo.dart';
import 'package:flow_music/datasource/services/firebase/auth/auth_fire.dart';
import 'package:flow_music/datasource/services/firebase/core/fire_core.dart';
import 'package:flow_music/domain/sources.dart' as sources;

class Domain {
  late AudioManaget audio;
  late AuthFire _auth;
  late FireCore fireCore;

  Domain() {
    //fireCore = FireCore(data: data);
    audio = AudioManaget();
    _auth = AuthFire();
  }

  PlayerState get status => audio.status;

  Stream<User?> get user => _auth.user;

  Future<void> dispose() async {
    return await audio.dispose();
  }

  Future<void> resume() async {
    return await audio.resume();
  }

  Future<void> pause() async {
    return await audio.pause();
  }

  Future<void> play({required sources.UrlSource source}) async {
    return await audio.play(source: source);
  }

  Future<void> setSource({required sources.UrlSource source}) async {
    return await audio.setSource(source: source);
  }

  Future<void> logAuth() async{
  return await  _auth.logAuth();
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/datasource/model/search_result.dart';
import 'package:flow_music/datasource/services/audio/implements_repo.dart';
import 'package:flow_music/datasource/services/firebase/auth/auth_fire.dart';
import 'package:flow_music/datasource/services/firebase/core/fire_core.dart';
import 'package:flow_music/datasource/services/http/search_query.dart';
import 'package:flow_music/domain/sources.dart' as sources;

class Domain {
  late AudioManaget _audio;
  late AuthFire _auth;
  late FireCore fireCore;

  Domain() {
    _audio = AudioManaget();
    _auth = AuthFire();
  }

  PlayerState get status => _audio.status;

  Stream<User?> get user => _auth.user;

  Future<void> dispose() async {
    return await _audio.dispose();
  }

  Future<void> resume() async {
    return await _audio.resume();
  }

  Future<void> pause() async {
    return await _audio.pause();
  }

  Future<void> play({required sources.UrlSource source}) async {
    return await _audio.play(source: source);
  }

  Future<void> setSource({required sources.UrlSource source}) async {
    return await _audio.setSource(source: source);
  }

  Future<void> logAuth() async {
    return await _auth.logAuth();
  }

  Future<SearchResult?> getListResult({required String query}) async {
    SearchQuery searchQuery = SearchQuery();
    return await searchQuery.getListSearch(query: query);
  }
}

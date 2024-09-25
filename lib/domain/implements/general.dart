import 'dart:async';

import 'package:flow_music/datasource/model/search_result.dart';
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/datasource/services/audio/audio_manger_audiop.dart';
import 'package:flow_music/datasource/services/audio/audio_manger_justa.dart';
import 'package:flow_music/datasource/services/firebase/auth/auth_fire.dart';
import 'package:flow_music/datasource/services/http/search_app_bar.dart';
import 'package:flow_music/datasource/services/http/song_result.dart';
import 'package:flow_music/domain/implements/audio/audio_repository.dart';
import 'package:flow_music/domain/implements/user/user_implement.dart';
import 'package:flow_music/domain/repository/audio_imp.dart';
import 'package:flow_music/domain/repository/geneal_imp.dart';
import 'package:flow_music/domain/repository/user_imp.dart';

class GeneralImplement extends GenealImp {
  late AudioImp _audioRepo;

  late UserImplement _user;

  GeneralImplement() {
    _audioRepo = AudioRepository(
        controllerManager: JustAudioManager(),
        streamingManager: AudioManagerAudioPlayer());
    _user = UserImplement(firebaseRepo: AuthFire());
  }

  @override
  AudioImp get audioRepository => _audioRepo;
  @override
  UserImp get userRepository => _user;

  Future<SearchResult?> getListResult({required String query}) async {
    final searchQuery = SearchAppbar();
    return await searchQuery.getListSearch(query: query);
  }

  Future<SongIdResponde?> resultSong({required String songId}) async {
    SongResult songResult = SongResult();
    return await songResult.songSerch(songId: songId);
  }
}

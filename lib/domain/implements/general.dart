import 'package:flow_music/datasource/services/audio/audio_manger_audiop.dart';
import 'package:flow_music/datasource/services/audio/audio_manger_justa.dart';
import 'package:flow_music/datasource/services/firebase/auth/auth_fire_service.dart';
import 'package:flow_music/datasource/services/http/load_param_play_list.dart';
import 'package:flow_music/datasource/services/http/load_play_list.dart';
import 'package:flow_music/datasource/services/http/search_app_bar.dart';
import 'package:flow_music/datasource/services/http/search_query_with_image.dart';
import 'package:flow_music/datasource/services/http/song_result.dart';
import 'package:flow_music/domain/implements/audio/audio_imp.dart';
import 'package:flow_music/domain/implements/http/http_imp.dart';
import 'package:flow_music/domain/implements/user/user_implement.dart';
import 'package:flow_music/domain/repository/audio_repo.dart';
import 'package:flow_music/domain/repository/geneal_repo.dart';
import 'package:flow_music/domain/repository/http_repo.dart';
import 'package:flow_music/domain/repository/user_imp.dart';

class GeneralImplement extends GenealRepo {
  @override
  AudioRepo get audioRepository => AudioImp(
      controllerManager: JustAudioManager(),
      streamingManager: AudioManagerAudioPlayer());
  @override
  UserImp get userRepository => UserImplement(firebaseRepo: AuthFireService());

  @override
  HttpRepo get httpRepo => HttpImp(
      loadPlayList: LoadPlayList(),
      loadParamasPlayListRepo: LoadParamsPlayList(),
      searchQuery: SearchAppbar(),
      songResult: SongResult(),
      searchQueryWithImage: SearchQueryWihtImage());
}

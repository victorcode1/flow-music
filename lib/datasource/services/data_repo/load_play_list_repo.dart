import 'package:flow_music/datasource/model/load_play_list.dart';

abstract class LoadPlayListRepo {
  Future<LoadPayListRessponse> loadPlayList(
      {required String songId,
      required String params,
      required String playlistId});
}

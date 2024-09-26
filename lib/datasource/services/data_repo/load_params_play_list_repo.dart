import 'package:flow_music/datasource/model/load_params_play_list_response.dart';

abstract class LoadParamsPlayListRepo {
  Future<LoadParamsPayListResult> loadPlayList({required String songId});
}

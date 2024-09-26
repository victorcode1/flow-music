import 'package:flow_music/datasource/services/data_repo/load_params_play_list_repo.dart';
import 'package:flow_music/datasource/services/data_repo/load_play_list_repo.dart';
import 'package:flow_music/datasource/services/data_repo/search_app_bar_data_repo.dart';
import 'package:flow_music/datasource/services/data_repo/search_query_with_image_repo.dart';
import 'package:flow_music/datasource/services/data_repo/song_result_data_repo.dart';

abstract class HttpRepo {
  LoadPlayListRepo get loadPlayList;
  LoadParamsPlayListRepo get loadParamsPlayList;
  SearchAppBarDataRepo get searchAppBarDataRepo;
  SongResultDataRepo get songResult;
  SearchQueryWithImageRepo get searchQueryWithImage;
}

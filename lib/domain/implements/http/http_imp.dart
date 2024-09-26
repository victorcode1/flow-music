import 'package:flow_music/datasource/services/data_repo/load_params_play_list_repo.dart';
import 'package:flow_music/datasource/services/data_repo/load_play_list_repo.dart';
import 'package:flow_music/datasource/services/data_repo/search_app_bar_data_repo.dart';
import 'package:flow_music/datasource/services/data_repo/search_query_with_image_repo.dart';
import 'package:flow_music/datasource/services/data_repo/song_result_data_repo.dart';
import 'package:flow_music/datasource/services/http/search_app_bar.dart';
import 'package:flow_music/datasource/services/http/song_result.dart';
import 'package:flow_music/domain/repository/http_repo.dart';

class HttpImp extends HttpRepo {
  final SongResultDataRepo _songResult;
  final SearchAppBarDataRepo _searchQuery;
  final SearchQueryWithImageRepo _searchQueryWithImage;
  final LoadParamsPlayListRepo _loadParamsPlayList;
  final LoadPlayListRepo _loadPlayList;

  HttpImp(
      {required SearchAppbar searchQuery,
      required SongResult songResult,
      required SearchQueryWithImageRepo searchQueryWithImage,
      required LoadParamsPlayListRepo loadParamasPlayListRepo,
      required LoadPlayListRepo loadPlayList})
      : _searchQuery = searchQuery,
        _songResult = songResult,
        _searchQueryWithImage = searchQueryWithImage,
        _loadParamsPlayList = loadParamasPlayListRepo,
        _loadPlayList = loadPlayList;

  @override
  SearchAppBarDataRepo get searchAppBarDataRepo => _searchQuery;

  @override
  SongResultDataRepo get songResult => _songResult;

  @override
  SearchQueryWithImageRepo get searchQueryWithImage => _searchQueryWithImage;

  @override
  LoadParamsPlayListRepo get loadParamsPlayList => _loadParamsPlayList;

  @override
  LoadPlayListRepo get loadPlayList =>  _loadPlayList;
}

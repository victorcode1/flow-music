import 'package:flow_music/datasource/model/list_search_result.dart';

abstract class SearchQueryWithImageRepo {
  Future<ListSearchSongResult?> searchResultData(String search);
}

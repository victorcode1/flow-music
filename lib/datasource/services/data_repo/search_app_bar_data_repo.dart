import 'package:flow_music/datasource/model/search_result.dart';

abstract class SearchAppBarDataRepo {
  Future<SearchResult?> getListSearch({required String query});
}
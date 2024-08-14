import 'package:flow_music/datasource/model/list_search_result.dart';
import 'package:flow_music/datasource/services/http/search_query.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListSongController {
  ListSongController();

  Future<ListSearchSongResult?> getListSong({required data}) async {
    SearchQuery searchQuery = SearchQuery();
    return await searchQuery.searchResultData(data);
  }

  int count({required ListSearchSongResult data}) {
    return data
            .contents
            ?.tabbedSearchResultsRenderer!
            .tabs
            ?.first
            .tabRenderer
            ?.content
            ?.sectionListRenderer!
            .contents
            ?.first
            .musicShelfRenderer
            ?.contents
            ?.length ??
        0;
  }

  void escuchar(
      {required ListSearchSongResult data,
      required BuildContext context,
      required int index}) {
    final idSong = data
        .contents
        ?.tabbedSearchResultsRenderer!
        .tabs
        ?.first
        .tabRenderer
        ?.content
        ?.sectionListRenderer
        ?.contents
        ?.first
        .musicShelfRenderer
        ?.contents?[index]
        .musicResponsiveListItemRenderer!
        .overlay
        ?.musicItemThumbnailOverlayRenderer!
        .content
        ?.musicPlayButtonRenderer
        ?.playNavigationEndpoint
        ?.watchEndpoint
        ?.videoId;
    final playListId = data
        .contents
        ?.tabbedSearchResultsRenderer!
        .tabs
        ?.first
        .tabRenderer
        ?.content
        ?.sectionListRenderer
        ?.contents
        ?.first
        .musicShelfRenderer
        ?.contents?[index]
        .musicResponsiveListItemRenderer
        ?.menu
        ?.menuRenderer
        ?.items
        ?.first
        .menuNavigationItemRenderer
        ?.navigationEndpoint
        ?.watchEndpoint
        ?.playlistId;

    if (context.mounted && context.canPop()) context.pop();
    context.goNamed('playSong', queryParameters: {
      'idSong': idSong ?? '',
      'playListId': playListId ?? '',
    });
  }

  String imageRes({required ListSearchSongResult data, required int index}) =>
      data
          .contents
          ?.tabbedSearchResultsRenderer!
          .tabs
          ?.first
          .tabRenderer
          ?.content
          ?.sectionListRenderer
          ?.contents
          ?.first
          .musicShelfRenderer
          ?.contents?[index]
          .musicResponsiveListItemRenderer!
          .thumbnail
          ?.musicThumbnailRenderer!
          .thumbnail
          ?.thumbnails?[1]
          .url ??
      '';

  String? subtitle({required ListSearchSongResult data, required int index}) {
    final sub = data
        .contents
        ?.tabbedSearchResultsRenderer
        ?.tabs
        ?.first
        .tabRenderer
        ?.content
        ?.sectionListRenderer
        ?.contents
        ?.first
        .musicShelfRenderer
        ?.contents?[index]
        .musicResponsiveListItemRenderer
        ?.flexColumns?[2]
        .musicResponsiveListItemFlexColumnRenderer
        ?.text
        ?.runs
        ?.first
        .text;
    return sub;
  }

  String dataRes({required ListSearchSongResult data, required int index}) {
    final dataRes = data
        .contents
        ?.tabbedSearchResultsRenderer
        ?.tabs
        ?.first
        .tabRenderer
        ?.content
        ?.sectionListRenderer!
        .contents
        ?.first
        .musicShelfRenderer
        ?.contents?[index];

    return dataRes
            ?.musicResponsiveListItemRenderer!
            .flexColumns
            ?.first
            .musicResponsiveListItemFlexColumnRenderer!
            .text
            ?.runs
            ?.first
            .text ??
        '';
  }

  Future<Map<String, String>> extra({required String data}) async {
    final res = await getListSong(data: data);
    final idSong = res
            ?.contents
            ?.tabbedSearchResultsRenderer!
            .tabs
            ?.first
            .tabRenderer
            ?.content
            ?.sectionListRenderer
            ?.contents
            ?.first
            .musicShelfRenderer
            ?.contents
            ?.first
            .musicResponsiveListItemRenderer!
            .overlay
            ?.musicItemThumbnailOverlayRenderer!
            .content
            ?.musicPlayButtonRenderer
            ?.playNavigationEndpoint
            ?.watchEndpoint
            ?.videoId ??
        '';
    final playListId = res
        ?.contents
        ?.tabbedSearchResultsRenderer!
        .tabs
        ?.first
        .tabRenderer
        ?.content
        ?.sectionListRenderer
        ?.contents
        ?.first
        .musicShelfRenderer
        ?.contents
        ?.first
        .musicResponsiveListItemRenderer
        ?.menu
        ?.menuRenderer
        ?.items
        ?.first
        .menuNavigationItemRenderer
        ?.navigationEndpoint
        ?.watchEndpoint
        ?.playlistId;
    return {idSong: playListId ?? ''};
  }
}

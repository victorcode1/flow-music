import 'package:flow_music/core/datasource/model/list_search_result.dart';
import 'package:flow_music/provider/list_search_result.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';

final listSongControllers = ChangeNotifierProvider<ListSongControllers>((ref) {
  return ListSongControllers(ref: ref);
});

class ListSongControllers extends ChangeNotifier {
  Ref ref;
  ListSongControllers({required this.ref});

  String imageRes({required ListSearchResult data, required int index}) =>
      data
          .contents
          ?.tabbedSearchResultsRenderer!
          .tabs!
          .first
          .tabRenderer!
          .content!
          .sectionListRenderer!
          .contents!
          .first
          .musicShelfRenderer!
          .contents?[index]
          .musicResponsiveListItemRenderer!
          .thumbnail!
          .musicThumbnailRenderer!
          .thumbnail!
          .thumbnails![1]
          .url ??
      '';

  Map<String, String> extra({required String data}) {
    final res = ref.watch(searchResultDataProvider(data)).asData?.value;
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

  AsyncValue result({required String data}) =>
      ref.watch(searchResultDataProvider(data)).when(
          data: (data) => AsyncData(data),
          error: (e, s) => AsyncError(e, s),
          loading: () => const AsyncLoading());

  ///Cantidad de items
  ///
  int count({required ListSearchResult data}) {
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
      {required ListSearchResult data,
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

  String? subtitle({required ListSearchResult data, required int index}) {
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

  String dataRes({required ListSearchResult data, required int index}) {
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
}

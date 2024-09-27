import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/datasource/model/list_search_result.dart';
import 'package:flow_music/domain/repository/geneal_repo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final listSongController =
    ChangeNotifierProvider.autoDispose<ListSongController>((ref) {
  final implement = ref.read(mainController).implement;

  return ListSongController(ref: ref, generalImplement: implement);
});

class ListSongController extends ChangeNotifier {
  final GenealRepo generalImplement;
  final AutoDisposeChangeNotifierProviderRef<ListSongController> ref;

  ListSongController({required this.ref, required this.generalImplement});

  Future<ListSearchSongResult?> getListSong({required data}) async {
    return await generalImplement.httpRepo.searchQueryWithImage
        .searchResultData(data);
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

    // context.pushNamed(Rutas.playSong.name, queryParameters: {
    //   'idSong': idSong ?? '',
    //   'playListId': playListId ?? '',
    // });

    // ref.read(mainController).buildView((data) => {
    //       'idSong': idSong ?? '',
    //       'playListId': playListId ?? '',
    //     });

    ref.read(mainController).buildView(data: {
      'idSong': idSong ?? '',
      'playListId': playListId ?? '',
    });
    notifyListeners();
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
          .musicResponsiveListItemRenderer
          ?.thumbnail
          ?.musicThumbnailRenderer
          ?.thumbnail
          ?.thumbnails?[0]
          .url ??
      '';

  String? totalReproduciones(
      {required ListSearchSongResult data, required int index}) {
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

  String nombreCaincion(
      {required ListSearchSongResult data, required int index}) {
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

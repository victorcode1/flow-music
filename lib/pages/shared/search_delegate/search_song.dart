//search delegate
import 'package:flow_music/pages/quick_list_search/list_search.dart';
import 'package:flow_music/pages/song/page/song.dart';
import 'package:flow_music/provider/list_search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchSong extends SearchDelegate {
  SearchSong()
    : super(
        searchFieldLabel: 'Buscar música...',
        searchFieldStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        toolbarHeight: 70,
        iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),
        titleTextStyle: theme.textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: theme.textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
      scaffoldBackgroundColor: colorScheme.surface,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear_rounded),
          tooltip: 'Limpiar',
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_rounded),
      tooltip: 'Volver',
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isNotEmpty
        ? Consumer(
            builder: (context, ref, child) {
              final res = ref
                  .watch(searchResultDataProvider(query))
                  .asData
                  ?.value;
              final idSong =
                  res
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
              Map<String, String?> extra = {idSong: playListId};
              return SongWidget(data: extra);
            },
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                "Escribe algo para buscar",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SuggestedListSearch(searchQuery: query);
  }
}

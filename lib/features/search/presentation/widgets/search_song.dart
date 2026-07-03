//search delegate
import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/search/presentation/pages/list_search.dart';
import 'package:flow_music/features/song/presentation/pages/song.dart';
import 'package:flow_music/features/search/presentation/providers/list_search_result.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewSearchDelegate extends SearchDelegate {
  ViewSearchDelegate()
    : super(
        searchFieldLabel: LocaleKeys.search_music_label.tr(),
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
          tooltip: LocaleKeys.clear.tr(),
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
      tooltip: LocaleKeys.back.tr(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isNotEmpty
        ? Consumer(
            builder: (context, ref, child) {
              final asyncResults = ref.watch(searchResultDataProvider(query));

              return asyncResults.when(
                data: (items) {
                  if (items.isEmpty || items.first.videoId.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          LocaleKeys.no_results.tr(),
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ),
                    );
                  }
                  final suggestion = items.first;
                  final duration = suggestion.duration;
                  final Map<String?, String?> data = {
                    'idSong': suggestion.videoId,
                    'playListId': '',
                    if (duration != null)
                      'durationMs': '${duration.inMilliseconds}',
                  };
                  return SongWidget(data: data);
                },
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                ),
                error: (error, stackTrace) => Builder(
                  builder: (context) {
                    debugPrint(
                      'Error fetching search results: $error $stackTrace',
                    );
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          LocaleKeys.error.tr(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                LocaleKeys.type_to_search.tr(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SuggestedListSearch(
      searchQuery: query,
      onSelect: (_) => close(context, null),
    );
  }
}

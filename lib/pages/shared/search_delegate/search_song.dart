//search delegate
import 'package:flow_music/pages/shared/list_search_secondary/controller/list_song_controller.dart';
import 'package:flow_music/pages/shared/list_search_secondary/list_songs.dart';
import 'package:flow_music/pages/song/page/song.dart';
import 'package:flow_music/home/providers/text_search.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchSong extends SearchDelegate {
  WidgetRef ref;
  SearchSong({required this.ref})
      : super(
          searchFieldLabel: 'Buscar música...',
          searchFieldStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ) {
    ref.read(searchProvider.notifier).setValue(query);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        toolbarHeight: 70,
        iconTheme: IconThemeData(
          color: colorScheme.onSurface,
          size: 24,
        ),
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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
    final controller = ref.watch(listSongControllers);
    return query.isNotEmpty
        ? SongWidget(data: controller.extra(data: query))
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
    return ListSongs(data: query);
  }
}

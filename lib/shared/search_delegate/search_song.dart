//search delegate
import 'package:flow_music/pages/song/page/song.dart';
import 'package:flow_music/provider/search.dart';
import 'package:flow_music/shared/list_search_secondary/controller/list_song_controller.dart';
import 'package:flow_music/shared/list_search_secondary/list_songs.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchSong extends SearchDelegate {
  WidgetRef ref;
  SearchSong({required this.ref}) {
    ref.read(searchProvider.notifier).setValue(query);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final controller = ref.watch(listSongControllers);
    return Song(data: controller.extra(data: query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListSongs(data: query);
  }
}

//search delegate
import 'package:flow_music/pages/shared/list_search_secondary/controller/list_song_controller.dart';
import 'package:flow_music/pages/shared/list_search_secondary/list_songs_with_image.dart';
import 'package:flow_music/pages/song/song_play.dart';
import 'package:flow_music/provider/search.dart';
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
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final controller = ref.watch(listSongController);
    return query.isNotEmpty
        ? FutureBuilder<Map<String, String>?>(
            future: controller.extra(data: query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error ${snapshot.error}'));
              }
              if (snapshot.data == null) {
                return const Center(child: Text("No hay resultados"));
              }
              if (snapshot.data?.isEmpty == null) {
                return const Center(child: Text("No hay resultados"));
              }

              return SongPlayWidget(data: snapshot.data ?? {});
            })
        : const Center(child: Text("No hay resultados"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListSongsWithImage(data: query);
  }
}

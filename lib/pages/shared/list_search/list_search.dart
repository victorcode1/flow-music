import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/core/const/roots/rutas.dart';
import 'package:flow_music/datasource/model/search_result.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListSearch extends ConsumerStatefulWidget {
  const ListSearch({super.key});

  @override
  ConsumerState<ListSearch> createState() => _ListSearchState();
}

class _ListSearchState extends ConsumerState<ListSearch> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(mainController);
    return FutureBuilder<SearchResult?>(
      future: controller.getListResult(query: controller.searchController.text),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error ${snapshot.error}'));
        }
        final suggestions = snapshot
            .data?.contents?.first.searchSuggestionsSectionRenderer?.contents;

        if (suggestions == null || suggestions.isEmpty) {
          return const Center(child: Text("No hay sugerencias disponibles"));
        }

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final dataRes = suggestions[index]
                .searchSuggestionRenderer!
                .navigationEndpoint!
                .searchEndpoint
                ?.query;
            return ListTile(
              onTap: () =>
                  context.go(RutasShelf.songs.rootValue, extra: dataRes),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.search),
                  Expanded(
                    child: Text(
                      dataRes ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

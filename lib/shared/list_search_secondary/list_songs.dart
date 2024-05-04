import 'package:flow_music/datasource/model/list_search_result.dart'
    show ListSearchResult;
import 'package:flow_music/provider/list_search_result.dart';
import 'package:flow_music/shared/list_search_secondary/controller/list_song_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListSongs extends ConsumerWidget {
  const ListSongs({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(listSongControllers);

    return switch (ref.watch(searchResultDataProvider(data))) {
      AsyncData<ListSearchResult>(:final value) => ListView.builder(
          itemCount: controller.count(data: value),
          itemBuilder: (context, index) {
            return ListTile(
                onTap: () => controller.escuchar(
                    data: value, context: context, index: index),
                style: ListTileStyle.list,
                leading: SizedBox(
                  height: 300,
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(0),
                    child: Image.network(
                        controller.imageRes(data: value, index: index),
                        fit: BoxFit.fitHeight),
                  ),
                ),
                subtitle: Text(
                  controller.subtitle(data: value, index: index),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                title: Text(
                  controller.dataRes(data: value, index: index),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ));
          },
        ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}

import 'package:flow_music/shared/list_search_secondary/controller/list_song_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListSongs extends ConsumerWidget {
  const ListSongs({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(listSongControllers);

    return Container(
        child: controller.result(data: data).when(
            data: (data) => data == null
                ? null
                : ListView.builder(
                    itemCount: controller.count(data: data),
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () => controller.escuchar(
                              data: data, context: context, index: index),
                          style: ListTileStyle.list,
                          leading: SizedBox(
                            height: 300,
                            child: ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                  controller.imageRes(data: data, index: index),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          subtitle: Text(
                            controller.subtitle(data: data, index: index),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          title: Text(
                            controller.dataRes(data: data, index: index),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ));
                    },
                  ),
            error: (error, stack) => Center(child: Text('Error $error $stack')),
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flow_music/datasource/model/list_search_result.dart' as l;
import 'package:flow_music/pages/shared/list_search_secondary/controller/list_song_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListSongsWithImage extends ConsumerWidget {
  const ListSongsWithImage({super.key, this.data});
  final String? data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(listSongController);

    return FutureBuilder<l.ListSearchSongResult?>(
        future: controller.getListSong(data: data),
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

          return ListView.builder(
            itemCount: controller.count(data: snapshot.data!),
            itemBuilder: (context, index) {
              return ListTile(
                  onTap: () => controller.escuchar(
                      data: snapshot.data!, context: context, index: index),
                  style: ListTileStyle.list,
                  leading: SizedBox(
                    width: 150,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(0),
                      child: CachedNetworkImage(
                          alignment: Alignment.centerRight,
                          imageUrl: controller.imageRes(
                              data: snapshot.data!, index: index),
                          imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fitHeight)),
                              ),
                          placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(strokeWidth: 2)),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.person)),
                    ),
                  ),
                  subtitle: Text(
                      controller.totalReproduciones(
                              data: snapshot.data!, index: index) ??
                          '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  title: Text(
                      controller.nombreCaincion(
                          data: snapshot.data!, index: index),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500)));
            },
          );
        });
  }
}

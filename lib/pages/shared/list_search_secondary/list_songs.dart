import 'package:cached_network_image/cached_network_image.dart';
import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/datasource/model/list_search_result.dart'
    as list_search;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListSongs extends ConsumerWidget {
  const ListSongs({super.key, this.data});
  final String? data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerr = ref.watch(mainController);

    return FutureBuilder<list_search.ListSearchSongResult?>(
        future: controllerr.getListSong(data: data),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: controllerr.count(
                data:
                    snapshot.data ?? const list_search.ListSearchSongResult()),
            itemBuilder: (context, index) {
              return ListTile(
                  onTap: () => controllerr.escuchar(
                      data: snapshot.data ??
                          const list_search.ListSearchSongResult(),
                      context: context,
                      index: index),
                  style: ListTileStyle.list,
                  leading: SizedBox(
                    width: 150,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(0),
                      child: CachedNetworkImage(
                        alignment: Alignment.centerRight,
                        imageUrl: controllerr.imageRes(
                            data: snapshot.data ??
                                const list_search.ListSearchSongResult(),
                            index: index),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.fitHeight),
                          ),
                        ),
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(strokeWidth: 2)),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.person),
                      ),
                    ),
                  ),
                  subtitle: Text(
                      controllerr.subtitle(
                              data: snapshot.data ??
                                  const list_search.ListSearchSongResult(),
                              index: index) ??
                          '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  title: Text(
                      controllerr.dataRes(
                          data: snapshot.data ??
                              const list_search.ListSearchSongResult(),
                          index: index),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500)));
            },
          );
        });
  }
}

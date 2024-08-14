import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/datasource/model/list_search_result.dart'
    as list_search;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListSongs extends ConsumerWidget {
  const ListSongs({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerr = ref.watch(mainController);

    return FutureBuilder<list_search.ListSearchSongResult?>(
        future: controllerr.getListSong(data: data),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: controllerr.count(
                data: snapshot.data ?? const list_search.ListSearchSongResult()),
            itemBuilder: (context, index) {
              return ListTile(
                  onTap: () => controllerr.escuchar(
                      data: snapshot.data ??
                          const list_search.ListSearchSongResult(),
                      context: context,
                      index: index),
                  style: ListTileStyle.list,
                  leading: SizedBox(
                    height: 300,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(0),
                      child: Image.network(
                          controllerr.imageRes(
                              data: snapshot.data ??
                                  const list_search.ListSearchSongResult(),
                              index: index),
                          fit: BoxFit.fitHeight),
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
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  title: Text(
                    controllerr.dataRes(
                        data: snapshot.data ??
                            const list_search.ListSearchSongResult(),
                        index: index),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ));
            },
          );
        });
  }
}

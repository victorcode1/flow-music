import 'package:flow_music/home/components/app_bar.dart';
import 'package:flow_music/home/controller/controller_page_builder.dart';
import 'package:flow_music/pages/shared/list_search/list_search.dart';
import 'package:flow_music/pages/shared/search_delegate/search_song.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  final Widget? child;
  const HomePage({super.key, this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(controllerPageBuilder);
    return Scaffold(
      appBar: const AppAbarMain(),
      body: child ?? ListSearch(),
      floatingActionButton: FloatingActionButton(
          heroTag: 'floatingActionButtonSearch',
          elevation: 1,
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          onPressed: () => controller.search(
              context: context, delegate: SearchSong(ref: ref)),
          child: const Icon(Icons.search)),
    );
  }
}

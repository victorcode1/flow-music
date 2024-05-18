import 'package:flow_music/pages/page_builder/components/app_bar.dart';
import 'package:flow_music/pages/page_builder/controller/controller_page_builder.dart';
import 'package:flow_music/shared/search_delegate/search_song.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageBuild extends ConsumerWidget {
  final Widget child;
  const PageBuild({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(controllerPageBuilder);
    return Scaffold(
      appBar: const AppAbarMain(),
      body: child,
      floatingActionButton: FloatingActionButton(
          heroTag: 'search',
          elevation: 1,
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          onPressed: () => controller.search(
              context: context, delegate: SearchSong(ref: ref)),
          child: const Icon(Icons.search)),
    );
  }
}

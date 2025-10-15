import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/home/components/app_bar.dart';
import 'package:flow_music/home/controller/controller_page_builder.dart';
import 'package:flow_music/home/controller/home_view_controller.dart';
import 'package:flow_music/home/repo/io_view_controller.dart';
import 'package:flow_music/pages/quick_list_search/list_search.dart';
import 'package:flow_music/pages/shared/list_search_secondary/list_songs.dart';
import 'package:flow_music/pages/shared/search_delegate/search_song.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  final Widget? child;
  const HomePage({super.key, this.child});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    implements IoViewController {
  @override
  Widget build(BuildContext context) {
    final viewState = ref.watch(homeViewProvider);
    final viewCtr = ref.read(homeViewProvider.notifier);
    final controller = ref.watch(controllerPageBuilder);
    return Scaffold(
      appBar: AppAbarMain(query: viewCtr.setQuery),
      body: DecoratedBox(
        decoration: BoxDecoration(
            gradient: Theme.of(context)
                .extension<FlowThemeExtras>()
                ?.secondaryGradient),
        child: SafeArea(
          child: AnimatedSwitcher(
              transitionBuilder: (child, animation) =>
                  SizeTransition(sizeFactor: animation, child: child),
              duration: const Duration(milliseconds: 500),
              child: switch (viewState) {
                QuickListSong(:final data) => QuickListSearch(
                    searchQuery: data, showListSearch: viewCtr.showListSearch),
                Suggested() => const Center(),
                ListSong(:final query) => ListSongs(data: query ?? ''),
              }),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient:
              Theme.of(context).extension<FlowThemeExtras>()?.primaryGradient,
          boxShadow: [
            BoxShadow(
              color:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: FloatingActionButton(
            heroTag: 'floatingActionButtonSearch',
            elevation: 0,
            backgroundColor: Colors.transparent,
            onPressed: () => controller.search(
                context: context, delegate: SearchSong(ref: ref)),
            child: const Icon(Icons.search_rounded,
                size: 28, color: Colors.white)),
      ),
    );
  }

  @override
  void showListSearch(String query) {}
}

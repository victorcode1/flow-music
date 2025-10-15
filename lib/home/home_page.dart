import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/home/components/app_bar.dart';
import 'package:flow_music/home/components/custom_drawe.dart';
import 'package:flow_music/home/controller/home_view_controller.dart';
import 'package:flow_music/home/repo/io_view_controller.dart';
import 'package:flow_music/pages/quick_list_search/list_search.dart';
import 'package:flow_music/pages/shared/list_search_secondary/list_songs.dart';
import 'package:flow_music/pages/shared/search_delegate/search_song.dart';
import 'package:flutter/material.dart' hide SearchDelegate;
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
    return Scaffold(
      drawer: CustomDrawe(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppAbarMain(
        query: viewCtr.setQuery,
        showSearch: () =>
            showSearch(context: context, delegate: ViewSearchDelegate()),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: Theme.of(
            context,
          ).extension<FlowThemeExtras>()?.secondaryGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: AnimatedSwitcher(
            transitionBuilder: (child, animation) =>
                SizeTransition(sizeFactor: animation, child: child),
            duration: const Duration(milliseconds: 500),
            child: switch (viewState) {
              SuggestedListSearchListSong(:final data) => SuggestedListSearch(
                searchQuery: data,
                showListSearch: viewCtr.showListSearch,
              ),
              Suggested() => const Center(),
              ListSong(:final query) => ListSongs(data: query ?? ''),
            },
          ),
        ),
      ),
    );
  }

  @override
  void showListSearch(String query) {}
}

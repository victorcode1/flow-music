import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/home/components/app_bar.dart';
import 'package:flow_music/home/controller/controller_page_builder.dart';
import 'package:flow_music/home/controller/home_view_controller.dart';
import 'package:flow_music/home/repo/io_view_controller.dart';
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
    final viewCtr =  ref.watch(homeViewControllerProvider.notifier);
    final controller = ref.watch(controllerPageBuilder);
    final theme = Theme.of(context);
    final extras = theme.extension<FlowThemeExtras>();
    return Scaffold(
      appBar: AppAbarMain(view: this, query: viewCtr.setQuey),
      body: DecoratedBox(
        decoration: BoxDecoration(gradient: extras?.secondaryGradient),
        child: SafeArea(
          top: false,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            child: viewCtr.buildView(
              page: (data) => switch (data) {
                ListSong() => Text('ListSong: ${data.data}'),
                Child() => widget.child ?? const SizedBox.shrink(),
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: extras?.primaryGradient,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.4),
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

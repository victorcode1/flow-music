import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/home/presentation/providers/text_search.dart';
import 'package:flow_music/core/audio/radio_mini_player.dart';
import 'package:flow_music/shared/widgets/flow_bottom_nav.dart';
import 'package:flutter/material.dart' hide SearchDelegate;
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeMobileBottomBar extends ConsumerWidget {
  const HomeMobileBottomBar({super.key, required this.currentPath});

  final String currentPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.read(searchProvider);

    void navigate(String targetPath) {
      if (currentPath == targetPath) return;
      searchController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
      context.go(targetPath);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const RadioMiniPlayer(),
        FlowBottomNav(
          destinations: [
            FlowNavDestination(
              icon: Icons.home_outlined,
              activeIcon: Icons.home_rounded,
              label: LocaleKeys.home.tr(),
              selected: currentPath == '/home',
              onTap: () => navigate('/home'),
            ),
            FlowNavDestination(
              icon: Icons.library_music_outlined,
              activeIcon: Icons.library_music_rounded,
              label: LocaleKeys.library.tr(),
              selected: currentPath == '/library',
              onTap: () => navigate('/library'),
            ),
            FlowNavDestination(
              icon: Icons.radio,
              activeIcon: Icons.radio_rounded,
              label: LocaleKeys.radio.tr(),
              selected: currentPath == '/radio',
              onTap: () => navigate('/radio'),
            ),
            FlowNavDestination(
              icon: Icons.travel_explore_outlined,
              activeIcon: Icons.travel_explore_rounded,
              label: LocaleKeys.radio_map_explorer_short.tr(),
              selected: currentPath == '/radio-map',
              onTap: () => navigate('/radio-map'),
            ),
            FlowNavDestination(
              icon: Icons.favorite_border_rounded,
              activeIcon: Icons.favorite_rounded,
              label: LocaleKeys.favorites.tr(),
              selected: currentPath == '/favorites',
              onTap: () => navigate('/favorites'),
            ),
            FlowNavDestination(
              icon: Icons.settings_outlined,
              activeIcon: Icons.settings_rounded,
              label: LocaleKeys.settings_short.tr(),
              selected: currentPath == '/settings',
              onTap: () => navigate('/settings'),
            ),
          ],
        ),
      ],
    );
  }
}

@Preview(name: 'Home mobile bottom nav')
Widget previewHomeMobileBottomNav() {
  return MaterialApp(
    home: Scaffold(
      bottomNavigationBar: HomeMobileBottomBar(currentPath: '/home'),
    ),
  );
}

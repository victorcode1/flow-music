import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/favorites/presentation/controllers/favorites_page_controller.dart';
import 'package:flow_music/features/favorites/presentation/widgets/favorite_stations_tab.dart';
import 'package:flow_music/features/favorites/presentation/widgets/favorites_page_shell.dart';
import 'package:flow_music/features/favorites/presentation/widgets/radio_playlists_tab.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Favoritos de la edición para tienda: emisoras y sus listas.
class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  static const _pageController = FavoritesPageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FavoritesPageShell(
      tabs: [
        Tab(text: LocaleKeys.favorites_tab_stations.tr()),
        Tab(text: LocaleKeys.favorites_tab_radio_playlists.tr()),
      ],
      tabViews: const [
        FavoriteStationsTab(pageController: _pageController),
        RadioPlaylistsTab(pageController: _pageController),
      ],
    );
  }
}

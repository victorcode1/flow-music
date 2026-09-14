import 'package:flow_music/core/routes/app_navigator_key.dart';
import 'package:flow_music/core/utils/adaptive_layout.dart';
import 'package:flow_music/features/favorites/presentation/pages/favorites_page.dart';
import 'package:flow_music/features/home/presentation/pages/home_page.dart';
import 'package:flow_music/features/library/presentation/pages/library_page.dart';
import 'package:flow_music/features/radio/presentation/pages/radio_map_explorer_page.dart';
import 'package:flow_music/features/radio/presentation/pages/radio_page.dart';
import 'package:flow_music/features/search/presentation/pages/list_search.dart';
import 'package:flow_music/features/settings/presentation/pages/settings_page.dart';
import 'package:flow_music/features/song/presentation/pages/song.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@Riverpod(keepAlive: true)
class Route extends _$Route {
  @override
  GoRouter build() {
    final navigatorKey = ref.read(appNavigatorKeyProvider);

    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              _noTransitionPage(state, const HomePage()),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) {
            final isWide =
                supportsFlowDesktopShell && useFlowWideLayout(context);
            return _noTransitionPage(
              state,
              HomePage(child: SettingsPage(embedded: isWide)),
            );
          },
        ),
        GoRoute(
          path: '/library',
          pageBuilder: (context, state) =>
              _noTransitionPage(state, const HomePage(child: LibraryPage())),
        ),
        GoRoute(
          path: '/radio',
          pageBuilder: (context, state) =>
              _noTransitionPage(state, const HomePage(child: RadioPage())),
        ),
        GoRoute(
          path: '/radio-map',
          pageBuilder: (context, state) => _noTransitionPage(
            state,
            const HomePage(child: RadioMapExplorerPage()),
          ),
        ),
        GoRoute(
          path: '/favorites',
          pageBuilder: (context, state) =>
              _noTransitionPage(state, const HomePage(child: FavoritesPage())),
        ),
        ShellRoute(
          pageBuilder: (context, state, child) =>
              _noTransitionPage(state, HomePage(child: child)),
          routes: [
            GoRoute(
              path: '/search',
              pageBuilder: (context, state) =>
                  _noTransitionPage(state, const SuggestedListSearch()),
            ),
            GoRoute(
              name: 'playSong',
              path: '/playSong',
              pageBuilder: (context, state) {
                Map<String?, String?> data = {
                  'idSong': state.uri.queryParameters['idSong'],
                  'playListId': state.uri.queryParameters['playListId'],
                  'mediaType': state.uri.queryParameters['mediaType'],
                  'durationMs': state.uri.queryParameters['durationMs'],
                };
                return _noTransitionPage(state, SongWidget(data: data));
              },
            ),
          ],
        ),
      ],
    );
  }
}

Page<void> _noTransitionPage(GoRouterState state, Widget child) {
  return NoTransitionPage<void>(key: state.pageKey, child: child);
}

/// Adapta el stream del usuario autenticado a un `Listenable`, que es lo que
/// go_router consume para reevaluar `redirect` cuando cambia la sesion.

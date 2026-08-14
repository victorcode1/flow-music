import 'package:flow_music/core/routes/app_navigator_key.dart';
import 'package:flow_music/core/monitoring/sentry_config.dart';
import 'package:flow_music/core/utils/adaptive_layout.dart';
import 'package:flow_music/features/favorites/presentation/pages/favorites_page.dart';
import 'package:flow_music/features/home/presentation/pages/home_page.dart';
import 'package:flow_music/features/library/presentation/pages/library_page.dart';
import 'package:flow_music/features/radio/presentation/pages/radio_map_explorer_page.dart';
import 'package:flow_music/features/radio/presentation/pages/radio_page.dart';
import 'package:flow_music/features/radio/presentation/pages/radio_player_page.dart';
import 'package:flow_music/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'routes.g.dart';

@Riverpod(keepAlive: true)
class Route extends _$Route {
  @override
  GoRouter build() {
    final navigatorKey = ref.read(appNavigatorKeyProvider);

    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: '/home',
      observers: [if (SentryConfig.enabled) SentryNavigatorObserver()],
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
        GoRoute(
          path: '/radio-player',
          pageBuilder: (context, state) => _noTransitionPage(
            state,
            const HomePage(child: RadioPlayerPage()),
          ),
        ),
      ],
    );
  }
}

Page<void> _noTransitionPage(GoRouterState state, Widget child) {
  return NoTransitionPage<void>(
    key: state.pageKey,
    name: state.uri.path,
    child: child,
  );
}

/// Adapta el stream del usuario autenticado a un `Listenable`, que es lo que
/// go_router consume para reevaluar `redirect` cuando cambia la sesion.

import 'dart:async';

import 'package:flow_music/core/routes/app_navigator_key.dart';
import 'package:flow_music/core/utils/adaptive_layout.dart';
import 'package:flow_music/features/auth/data/providers/auth_providers.dart';
import 'package:flow_music/features/auth/domain/entities/auth_user.dart';
import 'package:flow_music/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flow_music/features/auth/presentation/pages/login_page.dart';
import 'package:flow_music/features/favorites/presentation/pages/favorites_page.dart';
import 'package:flow_music/features/home/presentation/pages/home_page.dart';
import 'package:flow_music/features/library/presentation/pages/library_page.dart';
import 'package:flow_music/features/location_tracking/presentation/pages/admin_location_dashboard_page.dart';
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
    final authRepository = ref.read(authRepositoryProvider);
    final refreshListenable = _AuthRefreshNotifier(
      authRepository.authStateChanges,
    );
    final navigatorKey = ref.read(appNavigatorKeyProvider);
    ref.onDispose(refreshListenable.dispose);

    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: '/home',
      refreshListenable: refreshListenable,
      // El login es opcional: los invitados tienen sesion anonima para poder
      // persistir telemetria basica, pero siguen pudiendo entrar a /login.
      redirect: (context, state) {
        final repositoryUser = authRepository.currentUser;
        final authState = ref.read(authProvider);
        final authUser = authState.asData?.value ?? repositoryUser;
        final isLoggedIn =
            repositoryUser != null && !repositoryUser.isAnonymous;
        final isAdmin = authUser?.canAccessLocationDashboard == true;
        final goingToLogin = state.matchedLocation == '/login';
        if (isLoggedIn && goingToLogin) return '/home';
        if (state.matchedLocation == '/admin/locations' &&
            authState.isLoading) {
          return null;
        }
        if (state.matchedLocation == '/admin/locations' && !isAdmin) {
          return '/home';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) =>
              _noTransitionPage(state, const LoginPage()),
        ),
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              _noTransitionPage(state, const HomePage()),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) {
            if (supportsFlowDesktopShell && useFlowWideLayout(context)) {
              return _noTransitionPage(
                state,
                const HomePage(child: SettingsPage(embedded: true)),
              );
            }
            return _noTransitionPage(state, const SettingsPage());
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
          path: '/admin/locations',
          pageBuilder: (context, state) => _noTransitionPage(
            state,
            const HomePage(child: AdminLocationDashboardPage()),
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
class _AuthRefreshNotifier extends ChangeNotifier {
  _AuthRefreshNotifier(Stream<AuthUser?> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<AuthUser?> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

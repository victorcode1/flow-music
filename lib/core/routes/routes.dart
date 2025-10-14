import 'package:flow_music/home/page_builder.dart';
import 'package:flow_music/pages/settings/settings_page.dart';
import 'package:flow_music/pages/shared/list_search/list_search.dart';
import 'package:flow_music/pages/shared/list_search_secondary/list_songs.dart';
import 'package:flow_music/pages/song/page/song.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@Riverpod(keepAlive: true)
class Route extends _$Route {
  @override
  GoRouter build() {
    return GoRouter(initialLocation: '/home', routes: [
      GoRoute(
          path: '/home',
          builder: (context, state) {
            return HomePage();
          }),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
      ShellRoute(
          builder: (context, state, child) {
            return HomePage(child: child);
          },
          routes: [
            GoRoute(
                path: '/search',
                builder: (context, state) => const ListSearch()),
            GoRoute(
                path: '/songs',
                builder: (context, state) {
                  final search = state.extra as String;
                  return ListSongs(data: search);
                }),
            GoRoute(
              name: 'playSong',
              path: '/playSong',
              builder: (context, state) {
                Map<String?, String?> data = {
                  'idSong': state.uri.queryParameters['idSong'],
                  'playListId': state.uri.queryParameters['playListId']
                };

                //if (state.uri.queryParameters['id'] != null) {
                //data =
                //    state.uri.queryParameters['id'] as Map<String?, String?>;
                //  } //
                return SongWidget(data: data);
              },
            ),
          ]),
    ]);
  }
}

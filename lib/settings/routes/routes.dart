import 'package:flow_music/pages/page_builder/page/page_builder.dart';
import 'package:flow_music/shared/list_search/list_search.dart';
import 'package:flow_music/shared/list_search_secondary//list_songs.dart';
import 'package:flow_music/pages/song/page/song.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@Riverpod(keepAlive: true)
class Route extends _$Route {
  @override
  GoRouter build() {
    return GoRouter(initialLocation: '/search', routes: [
      ShellRoute(
          builder: (context, state, child) {
            return PageBuild(child: child);
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
              path: '/playSong',
              builder: (context, state) {
                final songId = state.extra as Map<String?, String?>;
                return Song(data: songId);
              },
            )
          ]),
    ]);
  }
}
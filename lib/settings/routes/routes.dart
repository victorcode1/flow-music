import 'package:flow_music/core/const/roots/rutas.dart';
import 'package:flow_music/pages/auth/auth_page.dart';
import 'package:flow_music/pages/home/page_builder.dart';
import 'package:flow_music/pages/profile/profile_page.dart';

import 'package:flow_music/pages/radio/radio_list.dart';
import 'package:flow_music/pages/radio_content/radio_content.dart';
import 'package:flow_music/pages/song/song.dart';
import 'package:flow_music/shared/list_search/list_search.dart';
import 'package:flow_music/shared/list_search_secondary//list_songs.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@Riverpod(keepAlive: true)
class Route extends _$Route {
  @override
  GoRouter build() {
    return GoRouter(initialLocation: Rutas.search.rootValue, routes: [
      ShellRoute(
          builder: (context, state, child) {
            return HomePageBuilder(view: child);
          },
          routes: [
            getRoute(Rutas.search),
            getRoute(Rutas.auth),
            getRoute(Rutas.songs),
            getRoute(Rutas.profile),
            getRoute(Rutas.radio),
            getRoute(Rutas.radioRadioContent),
            getRoute(Rutas.playSong),
          ]),
    ]);
  }

  GoRoute getRoute(Rutas ruta) {
    return switch (ruta) {
      Rutas.search => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) => const ListSearch(),
        ),
      Rutas.profile => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) => const ProfilePage(),
        ),
      Rutas.auth => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) => const AuthPage(),
        ),
      Rutas.songs => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) {
            final search = state.extra as String;
            return ListSongs(data: search);
          },
        ),
      Rutas.radioRadioContent => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) {
            return const RadioContent();
          }),
      Rutas.playSong => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) {
            Map<String?, String?> data = {
              'idSong': state.uri.queryParameters['idSong'],
              'playListId': state.uri.queryParameters['playListId']
            };
            return SongWidget(data: data);
          },
        ),
      Rutas.radio => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) {
            return const RadioList();
          }),
    };
  }
}

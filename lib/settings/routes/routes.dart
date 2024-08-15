import 'package:flow_music/core/const/roots/rutas.dart';
import 'package:flow_music/pages/auth_page/auth/auth_page.dart';
import 'package:flow_music/pages/auth_page/profile/profile_page.dart';
import 'package:flow_music/pages/home/home_page_builder.dart';
import 'package:flow_music/pages/radio/radio_list.dart';
import 'package:flow_music/pages/radio_content/radio_content.dart';
import 'package:flow_music/pages/shared/list_search/list_search.dart';
import 'package:flow_music/pages/shared/list_search_secondary/list_songs.dart';
import 'package:flow_music/pages/song/song_play.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@Riverpod(keepAlive: true)
class Route extends _$Route {
  @override
  GoRouter build() {
    return GoRouter(initialLocation: RutasShelf.search.rootValue, routes: [
      GoRoute(
        name: Rutas.playSong.name,
        path: Rutas.playSong.rootValue,
        builder: (context, state) {
          Map<String?, String?> data = {
            'idSong': state.uri.queryParameters['idSong'],
            'playListId': state.uri.queryParameters['playListId']
          };
          return SongWidget(data: data);
        },
      ),
      ShellRoute(
          builder: (context, state, child) {
            return HomePageBuilder(view: child);
          },
          routes: [
            getRoute(RutasShelf.search),
            getRoute(RutasShelf.auth),
            getRoute(RutasShelf.songs),
            getRoute(RutasShelf.profile),
            getRoute(RutasShelf.radio),
            getRoute(RutasShelf.radioRadioContent),
            //getRoute(Rutas.playSong),
          ]),
    ]);
  }

  GoRoute getRoute(RutasShelf ruta) {
    return switch (ruta) {
      RutasShelf.search => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) {
            return const ListSearch();
          },
        ),
      RutasShelf.profile => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) => const ProfilePage(),
        ),
      RutasShelf.auth => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) => const AuthPage(),
        ),
      RutasShelf.songs => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) {
            String? search;
            if ((state.extra as String?) != null) {
              search = state.extra as String;
              return ListSongs(data: search);
            }
            return const ListSongs();
          },
        ),
      RutasShelf.radioRadioContent => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) {
            return const RadioContent();
          }),
      // Rutas.playSong => GoRoute(
      //     name: ruta.name,
      //     path: ruta.rootValue,
      //     builder: (context, state) {
      //       Map<String?, String?> data = {
      //         'idSong': state.uri.queryParameters['idSong'],
      //         'playListId': state.uri.queryParameters['playListId']
      //       };
      //       return SongWidget(data: data);
      //     },
      //   ),
      RutasShelf.radio => GoRoute(
          name: ruta.name,
          path: ruta.rootValue,
          builder: (context, state) {
            return const RadioList();
          }),
    };
  }
}

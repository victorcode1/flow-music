import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/adaptive_layout.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/autoplay/presentation/controllers/autoplay_queue_controller.dart';
import 'package:flow_music/features/favorites/data/favorite_song.dart';
import 'package:flow_music/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:flow_music/features/favorites/presentation/controllers/favorites_page_controller.dart';
import 'package:flow_music/features/favorites/presentation/widgets/favorite_song_tile.dart';
import 'package:flow_music/features/favorites/presentation/widgets/favorite_songs_table.dart';
import 'package:flow_music/features/favorites/presentation/widgets/favorites_empty_state.dart';
import 'package:flow_music/features/home/presentation/providers/text_search.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Pestaña que muestra las canciones favoritas filtradas por la búsqueda global.
class FavoriteSongsTab extends ConsumerWidget {
  const FavoriteSongsTab({super.key, required this.pageController});

  final FavoritesPageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final favorites = ref.watch(favoritesControllerProvider);
    final controller = ref.read(favoritesControllerProvider.notifier);
    final searchController = ref.watch(searchProvider);

    return ListenableBuilder(
      listenable: searchController,
      builder: (context, _) {
        final visible = pageController.filterSongs(
          favorites,
          searchController.text,
        );

        if (visible.isEmpty) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              flowContentInset(context),
              16,
              flowContentInset(context),
              flowListBottomInset(context),
            ),
            child: FavoritesEmptyState(
              icon: Icons.favorite_border_rounded,
              message: LocaleKeys.no_favorites.tr(),
              colors: colors,
            ),
          );
        }

        // Al abrir una favorita se siembra la cola con la lista visible, para
        // que "siguiente" recorra los favoritos y el riel de cola del
        // escritorio tenga que mostrar.
        void play(int index) {
          ref
              .read(autoplayQueueControllerProvider.notifier)
              .enqueue(
                visible.map(_asSuggestion).toList(growable: false),
                index,
              );
          context.push(
            '/playSong?idSong=${visible[index].videoId}&playListId=',
          );
        }

        // En escritorio, tabla densa numerada (mockup "Favoritos —
        // escritorio"); en movil, las tarjetas de siempre.
        if (useFlowDesktopShell(context)) {
          return FavoriteSongsTable(
            songs: visible,
            padding: EdgeInsets.fromLTRB(
              flowContentInset(context),
              0,
              flowContentInset(context),
              flowListBottomInset(context),
            ),
            onPlay: play,
            onRemove: (song) => controller.remove(song.videoId),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.fromLTRB(
            flowContentInset(context),
            12,
            flowContentInset(context),
            flowListBottomInset(context),
          ),
          itemCount: visible.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final favorite = visible[index];
            return FavoriteSongTile(
              favorite: favorite,
              onTap: () => play(index),
              onRemove: () => controller.remove(favorite.videoId),
            );
          },
        );
      },
    );
  }
}

/// Adapta una favorita al modelo que consume la cola de reproduccion.
YouTubeSearchSuggestion _asSuggestion(FavoriteSong song) {
  return YouTubeSearchSuggestion(
    videoId: song.videoId,
    displayText: song.title,
    channelTitle: song.author,
    thumbnailUrl: song.thumbnailUrl,
  );
}

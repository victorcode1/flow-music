import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/favorites/presentation/controllers/favorites_page_controller.dart';
import 'package:flow_music/features/favorites/presentation/pages/radio_playlist_detail_page.dart';
import 'package:flow_music/features/favorites/presentation/widgets/favorites_empty_state.dart';
import 'package:flow_music/features/favorites/presentation/widgets/radio_playlist_tile.dart';
import 'package:flow_music/features/home/presentation/providers/text_search.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_favorites_controller.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_playlists_controller.dart';
import 'package:flow_music/features/radio/presentation/widgets/radio_playlist_actions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Pestaña que muestra playlists de radios y atajos para crearlas.
class RadioPlaylistsTab extends ConsumerWidget {
  const RadioPlaylistsTab({super.key, required this.pageController});

  final FavoritesPageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final playlists = ref.watch(radioPlaylistsControllerProvider);
    final controller = ref.read(radioPlaylistsControllerProvider.notifier);
    final favoriteStations = ref.watch(radioFavoritesControllerProvider);
    final searchController = ref.watch(searchProvider);

    return ListenableBuilder(
      listenable: searchController,
      builder: (context, _) {
        final visible = pageController.filterPlaylists(
          playlists,
          searchController.text,
        );

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.radio_playlists.tr(),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                FilledButton.icon(
                  onPressed: () =>
                      showCreateRadioPlaylistFlow(context: context, ref: ref),
                  icon: const Icon(Icons.add_rounded),
                  label: Text(LocaleKeys.new_radio_playlist.tr()),
                ),
              ],
            ),
            if (favoriteStations.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ActionChip(
                  avatar: const Icon(Icons.radio_rounded),
                  label: Text(LocaleKeys.smart_favorite_stations.tr()),
                  onPressed: () => pageController.createPlaylistFromFavorites(
                    context: context,
                    ref: ref,
                    stations: favoriteStations,
                  ),
                ),
              ),
            const SizedBox(height: 12),
            if (visible.isEmpty)
              FavoritesEmptyState(
                icon: Icons.queue_music_rounded,
                message: LocaleKeys.empty_radio_playlists.tr(),
                colors: colors,
              )
            else
              ...visible.map(
                (playlist) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: RadioPlaylistTile(
                    playlist: playlist,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return RadioPlaylistDetailPage(
                            playlistId: playlist.id,
                            pageController: pageController,
                          );
                        },
                      ),
                    ),
                    onDelete: () => controller.delete(playlist.id),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

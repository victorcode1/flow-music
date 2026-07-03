import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/favorites/presentation/controllers/favorites_page_controller.dart';
import 'package:flow_music/features/favorites/presentation/widgets/favorites_empty_state.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_playlists_controller.dart';
import 'package:flow_music/features/radio/presentation/utils/play_radio_station.dart';
import 'package:flow_music/features/radio/presentation/widgets/radio_playlist_actions.dart';
import 'package:flow_music/features/radio/presentation/widgets/radio_station_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Detalle de una playlist de radios desde la sección de favoritos.
class RadioPlaylistDetailPage extends ConsumerWidget {
  const RadioPlaylistDetailPage({
    super.key,
    required this.playlistId,
    this.pageController = const FavoritesPageController(),
  });

  final String playlistId;
  final FavoritesPageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final playlists = ref.watch(radioPlaylistsControllerProvider);
    final playlist = pageController.findPlaylistById(playlists, playlistId);

    if (playlist == null) {
      return const Scaffold(body: SizedBox());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          playlist.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            tooltip: MaterialLocalizations.of(context).deleteButtonTooltip,
            onPressed: () async {
              await ref
                  .read(radioPlaylistsControllerProvider.notifier)
                  .delete(playlist.id);
              if (context.mounted) Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete_outline_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Text(
            stationCountLabel(playlist.itemCount),
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          if (playlist.items.isEmpty)
            FavoritesEmptyState(
              icon: Icons.radio_rounded,
              message: LocaleKeys.empty_radio_playlist.tr(),
              colors: colors,
            )
          else
            ...playlist.items.indexed.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: RadioStationTile(
                  station: entry.$2,
                  onTap: () => playRadioStation(
                    context: context,
                    ref: ref,
                    station: entry.$2,
                    queue: playlist.items,
                    index: entry.$1,
                  ),
                  onRemove: () => ref
                      .read(radioPlaylistsControllerProvider.notifier)
                      .removeStation(playlist.id, entry.$2),
                  removeLabel: LocaleKeys.delete.tr(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

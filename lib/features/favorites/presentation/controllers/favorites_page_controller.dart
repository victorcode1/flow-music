import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/core/utils/search_text_normalizer.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_favorites_controller.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_playlists_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Coordina filtros y acciones de presentacion para la pantalla de favoritos.
class FavoritesPageController {
  const FavoritesPageController();

  List<RadioStation> filterStations(
    List<RadioStation> stations,
    String rawQuery,
  ) {
    final query = normalizeSearchText(rawQuery);
    if (query.isEmpty) return stations;
    return stations
        .where(
          (station) =>
              searchTextContains(station.name, query) ||
              searchTextContains(station.country, query) ||
              searchTextContains(station.tags, query),
        )
        .toList();
  }

  List<RadioPlaylist> filterPlaylists(
    List<RadioPlaylist> playlists,
    String rawQuery,
  ) {
    final query = normalizeSearchText(rawQuery);
    if (query.isEmpty) return playlists;
    return playlists
        .where((playlist) => searchTextContains(playlist.name, query))
        .toList();
  }

  String stationKey(RadioStation station) {
    if (station.stationUuid.isNotEmpty) return station.stationUuid;
    return station.streamUrl;
  }

  RadioPlaylist? findPlaylistById(
    List<RadioPlaylist> playlists,
    String playlistId,
  ) {
    for (final playlist in playlists) {
      if (playlist.id == playlistId) return playlist;
    }
    return null;
  }

  Future<void> removeStation({
    required BuildContext context,
    required RadioFavoritesController controller,
    required RadioStation station,
  }) async {
    await controller.remove(stationKey(station));
    if (!context.mounted) return;
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(content: Text(LocaleKeys.radio_favorite_removed.tr())),
    );
  }

  Future<void> createPlaylistFromFavorites({
    required BuildContext context,
    required WidgetRef ref,
    required List<RadioStation> stations,
  }) async {
    final name = LocaleKeys.smart_favorite_stations.tr();
    await ref
        .read(radioPlaylistsControllerProvider.notifier)
        .createWithItems(name, stations);
    if (!context.mounted) return;
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(content: Text(LocaleKeys.radio_playlist_created.tr())),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/favorites/data/favorite_song.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_favorites_controller.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_playlists_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Coordina filtros y acciones de presentacion para la pantalla de favoritos.
class FavoritesPageController {
  const FavoritesPageController();

  List<FavoriteSong> filterSongs(
    List<FavoriteSong> favorites,
    String rawQuery,
  ) {
    final query = _normalizeQuery(rawQuery);
    if (query.isEmpty) return favorites;
    return favorites
        .where(
          (favorite) =>
              favorite.title.toLowerCase().contains(query) ||
              favorite.author.toLowerCase().contains(query),
        )
        .toList();
  }

  List<RadioStation> filterStations(
    List<RadioStation> stations,
    String rawQuery,
  ) {
    final query = _normalizeQuery(rawQuery);
    if (query.isEmpty) return stations;
    return stations
        .where(
          (station) =>
              station.name.toLowerCase().contains(query) ||
              station.country.toLowerCase().contains(query) ||
              station.tags.toLowerCase().contains(query),
        )
        .toList();
  }

  List<RadioPlaylist> filterPlaylists(
    List<RadioPlaylist> playlists,
    String rawQuery,
  ) {
    final query = _normalizeQuery(rawQuery);
    if (query.isEmpty) return playlists;
    return playlists
        .where((playlist) => playlist.name.toLowerCase().contains(query))
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

  String _normalizeQuery(String rawQuery) => rawQuery.trim().toLowerCase();
}

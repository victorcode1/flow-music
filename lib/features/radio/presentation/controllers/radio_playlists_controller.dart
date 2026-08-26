import 'dart:async';

import 'package:flow_music/core/analytics/product_analytics.dart';
import 'package:flow_music/core/engagement/review_prompt_coordinator.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_playlists_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final radioPlaylistsControllerProvider =
    NotifierProvider<RadioPlaylistsController, List<RadioPlaylist>>(
      RadioPlaylistsController.new,
    );

class RadioPlaylistsController extends Notifier<List<RadioPlaylist>> {
  final RadioPlaylistsRepository _repository = const RadioPlaylistsRepository();

  @override
  List<RadioPlaylist> build() => _repository.readAll();

  Future<RadioPlaylist> create(String rawName) async {
    final name = rawName.trim();
    if (name.isEmpty) {
      throw ArgumentError.value(rawName, 'rawName', 'Playlist name is empty');
    }
    final now = DateTime.now();
    final playlist = RadioPlaylist(
      id: now.microsecondsSinceEpoch.toString(),
      name: name,
      createdAt: now,
      updatedAt: now,
      items: const [],
    );
    await _repository.save(playlist);
    state = [playlist, ...state];
    unawaited(ref.read(productAnalyticsProvider).track('playlist_created'));
    unawaited(
      ref
          .read(reviewPromptCoordinatorProvider)
          .considerReviewAfterPositiveMoment('playlist_created'),
    );
    return playlist;
  }

  Future<RadioPlaylist> createWithItems(
    String rawName,
    Iterable<RadioStation> rawItems,
  ) async {
    final playlist = await create(rawName);
    final uniqueItems = <String, RadioStation>{};
    for (final item in rawItems) {
      final key = radioPlaylistItemKey(item);
      if (key.isNotEmpty) uniqueItems[key] = item;
    }
    final updated = playlist.copyWith(
      updatedAt: DateTime.now(),
      items: uniqueItems.values.toList(),
    );
    await _repository.save(updated);
    state = [
      updated,
      ...state.where((candidate) => candidate.id != updated.id),
    ];
    return updated;
  }

  Future<void> delete(String playlistId) async {
    await _repository.delete(playlistId);
    state = state.where((playlist) => playlist.id != playlistId).toList();
  }

  Future<void> addStation(String playlistId, RadioStation station) async {
    final playlist = _findById(playlistId);
    if (playlist == null) return;
    final key = radioPlaylistItemKey(station);
    if (key.isEmpty ||
        playlist.items.any((item) => radioPlaylistItemKey(item) == key)) {
      return;
    }
    final updated = playlist.copyWith(
      updatedAt: DateTime.now(),
      items: [station, ...playlist.items],
    );
    await _repository.save(updated);
    state = [
      updated,
      ...state.where((candidate) => candidate.id != playlistId),
    ];
    unawaited(
      ref
          .read(productAnalyticsProvider)
          .track(
            'station_added_to_playlist',
            properties: {
              if (station.stationUuid.isNotEmpty)
                'station_id': station.stationUuid,
              if (station.countryCode.isNotEmpty)
                'country_code': station.countryCode.toUpperCase(),
            },
          ),
    );
  }

  Future<void> removeStation(String playlistId, RadioStation station) async {
    final playlist = _findById(playlistId);
    if (playlist == null) return;
    final key = radioPlaylistItemKey(station);
    final updated = playlist.copyWith(
      updatedAt: DateTime.now(),
      items: playlist.items
          .where((item) => radioPlaylistItemKey(item) != key)
          .toList(),
    );
    await _repository.save(updated);
    state = [
      updated,
      ...state.where((candidate) => candidate.id != playlistId),
    ];
  }

  RadioPlaylist? _findById(String playlistId) {
    for (final playlist in state) {
      if (playlist.id == playlistId) return playlist;
    }
    return null;
  }
}

import 'dart:async';

import 'package:flow_music/core/analytics/product_analytics.dart';
import 'package:flow_music/core/engagement/review_prompt_coordinator.dart';
import 'package:flow_music/features/account/presentation/providers/local_user_data_providers.dart';
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
  List<RadioPlaylist> build() {
    ref.watch(localUserDataRevisionProvider);
    return _repository.readAll();
  }

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
    await ref
        .read(localUserDataCoordinatorProvider)
        .editPlaylists(() => _repository.save(playlist));
    state = _repository.readAll();
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
    final updated = await ref
        .read(localUserDataCoordinatorProvider)
        .editPlaylists(() async {
          final current = _findById(playlist.id);
          if (current == null) {
            throw StateError('The account changed while creating the playlist');
          }
          final next = current.copyWith(
            updatedAt: DateTime.now(),
            items: uniqueItems.values.toList(),
          );
          await _repository.save(next);
          return next;
        });
    state = _repository.readAll();
    return updated;
  }

  Future<void> delete(String playlistId) async {
    await ref
        .read(localUserDataCoordinatorProvider)
        .editPlaylists(() => _repository.delete(playlistId));
    state = _repository.readAll();
  }

  Future<void> addStation(String playlistId, RadioStation station) async {
    final updated = await ref
        .read(localUserDataCoordinatorProvider)
        .editPlaylists(() async {
          final current = _findById(playlistId);
          if (current == null) return false;
          final key = radioPlaylistItemKey(station);
          if (key.isEmpty ||
              current.items.any((item) => radioPlaylistItemKey(item) == key)) {
            return false;
          }
          await _repository.save(
            current.copyWith(
              updatedAt: DateTime.now(),
              items: [station, ...current.items],
            ),
          );
          return true;
        });
    state = _repository.readAll();
    if (!updated) return;
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
    await ref.read(localUserDataCoordinatorProvider).editPlaylists(() async {
      final current = _findById(playlistId);
      if (current == null) return;
      final key = radioPlaylistItemKey(station);
      await _repository.save(
        current.copyWith(
          updatedAt: DateTime.now(),
          items: current.items
              .where((item) => radioPlaylistItemKey(item) != key)
              .toList(),
        ),
      );
    });
    state = _repository.readAll();
  }

  RadioPlaylist? _findById(String playlistId) {
    for (final playlist in _repository.readAll()) {
      if (playlist.id == playlistId) return playlist;
    }
    return null;
  }
}

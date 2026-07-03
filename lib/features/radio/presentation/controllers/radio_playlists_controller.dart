import 'package:flow_music/core/sync/cloud_sync_controller.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_playlists_providers.dart';
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
    ref.listen<CloudSyncState>(cloudSyncControllerProvider, (prev, next) {
      if (next is CloudSyncDone) {
        state = _repository.readAll();
      }
    });
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
    await _repository.save(playlist);
    state = [playlist, ...state];
    _pushRemote();
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
      if (key.isEmpty) continue;
      uniqueItems[key] = item;
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
    _pushRemote();
    return updated;
  }

  Future<void> delete(String playlistId) async {
    await _repository.delete(playlistId);
    state = state.where((playlist) => playlist.id != playlistId).toList();
    _pushRemote();
  }

  Future<void> addStation(String playlistId, RadioStation station) async {
    final playlist = _findById(playlistId);
    if (playlist == null) return;
    final key = radioPlaylistItemKey(station);
    if (key.isEmpty) return;
    if (playlist.items.any((item) => radioPlaylistItemKey(item) == key)) return;

    final updated = playlist.copyWith(
      updatedAt: DateTime.now(),
      items: [station, ...playlist.items],
    );
    await _repository.save(updated);
    state = [
      updated,
      ...state.where((candidate) => candidate.id != playlistId),
    ];
    _pushRemote();
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
    _pushRemote();
  }

  RadioPlaylist? _findById(String playlistId) {
    for (final playlist in state) {
      if (playlist.id == playlistId) return playlist;
    }
    return null;
  }

  void _pushRemote() {
    final sync = ref.read(radioPlaylistsSyncProvider);
    ref.read(cloudSyncControllerProvider.notifier).pushOne(sync);
  }
}

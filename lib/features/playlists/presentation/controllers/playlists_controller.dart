import 'package:flow_music/core/sync/cloud_sync_controller.dart';
import 'package:flow_music/features/library/data/downloaded_audio.dart';
import 'package:flow_music/features/playlists/data/playlist.dart';
import 'package:flow_music/features/playlists/data/playlists_providers.dart';
import 'package:flow_music/features/playlists/data/playlists_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final playlistsControllerProvider =
    NotifierProvider<PlaylistsController, List<Playlist>>(
      PlaylistsController.new,
    );

class PlaylistsController extends Notifier<List<Playlist>> {
  final PlaylistsRepository _repository = const PlaylistsRepository();

  @override
  List<Playlist> build() {
    ref.listen<CloudSyncState>(cloudSyncControllerProvider, (prev, next) {
      if (next is CloudSyncDone) {
        state = _repository.readAll();
      }
    });
    return _repository.readAll();
  }

  Future<Playlist> create(String rawName) async {
    final name = rawName.trim();
    if (name.isEmpty) {
      throw ArgumentError.value(rawName, 'rawName', 'Playlist name is empty');
    }

    final now = DateTime.now();
    final playlist = Playlist(
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

  Future<Playlist> createWithItems(
    String rawName,
    Iterable<DownloadedAudio> rawItems,
  ) async {
    final playlist = await create(rawName);
    final uniqueItems = <String, DownloadedAudio>{};
    for (final item in rawItems) {
      uniqueItems[playlistItemKey(item)] = item;
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

  Future<Playlist?> importFromJson(String rawJson) async {
    final playlist = PlaylistsRepository.decodePlaylistJson(rawJson);
    if (playlist == null || playlist.name.trim().isEmpty) return null;
    final now = DateTime.now();
    final imported = playlist.copyWith(
      id: now.microsecondsSinceEpoch.toString(),
      createdAt: now,
      updatedAt: now,
    );
    await _repository.save(imported);
    state = [imported, ...state];
    _pushRemote();
    return imported;
  }

  Future<void> delete(String playlistId) async {
    await _repository.delete(playlistId);
    state = state.where((playlist) => playlist.id != playlistId).toList();
    _pushRemote();
  }

  Future<void> addItem(String playlistId, DownloadedAudio audio) async {
    final playlist = _findById(playlistId);
    if (playlist == null) return;

    final key = playlistItemKey(audio);
    if (playlist.items.any((item) => playlistItemKey(item) == key)) return;

    final updated = playlist.copyWith(
      updatedAt: DateTime.now(),
      items: [audio, ...playlist.items],
    );
    await _repository.save(updated);
    state = [
      updated,
      ...state.where((candidate) => candidate.id != playlistId),
    ];
    _pushRemote();
  }

  Future<void> removeItem(String playlistId, DownloadedAudio audio) async {
    final playlist = _findById(playlistId);
    if (playlist == null) return;

    final key = playlistItemKey(audio);
    final updated = playlist.copyWith(
      updatedAt: DateTime.now(),
      items: playlist.items
          .where((item) => playlistItemKey(item) != key)
          .toList(),
    );
    await _repository.save(updated);
    state = [
      updated,
      ...state.where((candidate) => candidate.id != playlistId),
    ];
    _pushRemote();
  }

  Playlist? _findById(String playlistId) {
    for (final playlist in state) {
      if (playlist.id == playlistId) return playlist;
    }
    return null;
  }

  void _pushRemote() {
    final sync = ref.read(playlistsSyncProvider);
    ref.read(cloudSyncControllerProvider.notifier).pushOne(sync);
  }
}

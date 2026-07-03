import 'dart:convert';

import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

const String radioPlaylistsBoxName = 'radio_playlists';
const String _ownerUidKey = '__owner_uid';

class RadioPlaylistsRepository {
  const RadioPlaylistsRepository();

  static RadioPlaylist? decodePlaylistJson(String raw) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      return RadioPlaylist.fromJson(decoded);
    } catch (_) {
      return null;
    }
  }

  Box get _box => Hive.box(radioPlaylistsBoxName);

  List<RadioPlaylist> readAll() {
    final result = <RadioPlaylist>[];
    for (final key in _box.keys) {
      if (key == _ownerUidKey) continue;
      final playlist = _decode(_box.get(key));
      if (playlist != null) result.add(playlist);
    }
    result.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return List.unmodifiable(result);
  }

  Future<void> save(RadioPlaylist playlist) async {
    if (playlist.id.isEmpty) return;
    await _box.put(playlist.id, jsonEncode(playlist.toJson()));
  }

  Future<void> delete(String playlistId) async {
    if (playlistId.isEmpty) return;
    await _box.delete(playlistId);
  }

  Future<void> replaceAll(Iterable<RadioPlaylist> playlists) async {
    await _box.clear();
    final entries = <String, String>{};
    for (final playlist in playlists) {
      if (playlist.id.isEmpty) continue;
      entries[playlist.id] = jsonEncode(playlist.toJson());
    }
    if (entries.isEmpty) return;
    await _box.putAll(entries);
  }

  String? ownerUid() {
    final value = _box.get(_ownerUidKey);
    return value is String && value.isNotEmpty ? value : null;
  }

  Future<void> markOwner(String uid) async {
    await _box.put(_ownerUidKey, uid);
  }

  Future<void> clearForUser(String uid) async {
    await _box.clear();
    await markOwner(uid);
  }

  RadioPlaylist? _decode(Object? raw) {
    try {
      if (raw is! String || raw.isEmpty) return null;
      final json = jsonDecode(raw);
      if (json is! Map<String, dynamic>) return null;
      return RadioPlaylist.fromJson(json);
    } catch (error, stackTrace) {
      debugPrint('RadioPlaylistsRepository decode failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }
}

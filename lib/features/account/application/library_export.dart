import 'dart:convert';
import 'dart:typed_data';
import 'package:flow_music/features/account/domain/entities/synced_user_data.dart';

/// Portable library only: never exports account IDs, email or auth tokens.
class LibraryExport {
  static Uint8List encode(SyncedUserData data, {DateTime? now}) =>
      Uint8List.fromList(
        utf8.encode(
          const JsonEncoder.withIndent('  ').convert({
            'format': 'streambeat-library',
            'version': 1,
            'exported_at': (now ?? DateTime.now()).toUtc().toIso8601String(),
            'favorites': data.favorites.map((x) => x.toJson()).toList(),
            'playlists': data.playlists.map((x) => x.toJson()).toList(),
            'preferences': data.preferences.toJson(),
          }),
        ),
      );
}

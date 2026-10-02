import 'dart:convert';
import 'package:flow_music/features/account/application/library_export.dart';
import 'package:flow_music/features/account/data/auth_attempt_guard.dart';
import 'package:flow_music/features/account/domain/entities/local_user_data.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/settings/data/user_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'local export is portable and excludes account identifiers and sessions',
    () {
      final when = DateTime.utc(2026, 9, 9);
      final data = LocalUserData(
        favorites: const [],
        playlists: [
          RadioPlaylist(
            id: 'p1',
            name: 'Mis radios',
            createdAt: when,
            updatedAt: when,
            items: const [],
          ),
        ],
        preferences: const UserSettings(),
      );
      final json =
          jsonDecode(utf8.decode(LibraryExport.encode(data, now: when))) as Map;
      expect(json['format'], 'streambeat-library');
      expect(json['version'], 1);
      expect(json['playlists'][0]['name'], 'Mis radios');
      expect(json.containsKey('user_id'), isFalse);
      expect(json.containsKey('email'), isFalse);
      expect(json.containsKey('access_token'), isFalse);
      final restored = LocalUserData.fromJson(Map<String, dynamic>.from(json));
      expect(restored.playlists.single.name, 'Mis radios');
    },
  );
  test(
    'auth request guard bounds repeated login but leaves recovery independent',
    () {
      var now = DateTime.utc(2026, 9, 9);
      final guard = AuthAttemptGuard(now: () => now);
      for (var i = 0; i < 5; i++) {
        guard.check('sign_in');
      }
      expect(() => guard.check('sign_in'), throwsA(isA<AuthFailure>()));
      guard.check('password_reset');
      now = now.add(const Duration(minutes: 1));
      guard.check('sign_in');
    },
  );
  test('signup and recovery email have a longer cooldown', () {
    var now = DateTime.utc(2026, 9, 9);
    final guard = AuthAttemptGuard(now: () => now);
    for (var i = 0; i < 3; i++) {
      guard.check('password_reset');
    }
    now = now.add(const Duration(minutes: 1));
    expect(() => guard.check('password_reset'), throwsA(isA<AuthFailure>()));
    now = now.add(const Duration(minutes: 9));
    guard.check('password_reset');
  });
}

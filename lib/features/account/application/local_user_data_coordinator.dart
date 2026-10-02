import 'dart:async';

import 'package:flow_music/features/account/data/user_data_local_store.dart';
import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/entities/local_user_data.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';

/// Serializes local edits and account changes, with no network dependency.
class LocalUserDataCoordinator {
  LocalUserDataCoordinator(
    this._auth,
    this._local, {
    required VoidCallback onLocalDataChanged,
  }) : _onLocalDataChanged = onLocalDataChanged;

  final AuthRepository _auth;
  final UserDataLocalStore _local;
  final VoidCallback _onLocalDataChanged;
  StreamSubscription<AppUser?>? _authListener;
  Future<void> _serial = Future<void>.value();
  bool _initialized = false;
  bool _disposed = false;

  Future<void> initialize() async {
    if (_initialized || _disposed) return;
    _initialized = true;
    _authListener = _auth.authStateChanges.listen((user) {
      if (_disposed) return;
      unawaited(
        _selectUser(user?.id).catchError((Object error) {
          debugPrint(
            'Unable to restore local account data: ${error.runtimeType}',
          );
        }),
      );
    });
    await selectCurrentUser();
  }

  Future<void> selectCurrentUser() => _selectUser(_auth.currentUser?.id);

  Future<void> _selectUser(String? userId) => _enqueue(() async {
    if (await _local.switchUser(userId)) _notify();
  });

  Future<T> editFavorites<T>(Future<T> Function() edit) => _edit(edit);
  Future<T> editPlaylists<T>(Future<T> Function() edit) => _edit(edit);
  Future<T> editPreferences<T>(Future<T> Function() edit) => _edit(edit);

  Future<T> _edit<T>(Future<T> Function() edit) {
    final userId = _auth.currentUser?.id;
    return _enqueue(() async {
      if (await _local.switchUser(userId)) _notify();
      final result = await edit();
      await _local.archiveCurrent();
      return result;
    });
  }

  Future<void> flushCurrentUser() {
    final userId = _auth.currentUser?.id;
    return _enqueue(() async {
      if (await _local.switchUser(userId)) _notify();
      await _local.archiveCurrent();
    });
  }

  Future<LocalUserData> readCurrentUser() {
    final userId = _auth.currentUser?.id;
    return _enqueue(() async {
      if (await _local.switchUser(userId)) _notify();
      return _local.read();
    });
  }

  Future<void> deleteLocalAccount(String? userId) => _enqueue(() async {
    await _local.deleteAccount(userId);
    _notify();
  });

  Future<T> _enqueue<T>(Future<T> Function() operation) {
    if (_disposed) return Future.error(StateError('Local store is disposed'));
    final result = _serial.then((_) => operation());
    _serial = result.then<void>((_) {}, onError: (Object _, StackTrace _) {});
    return result;
  }

  void _notify() {
    if (!_disposed) _onLocalDataChanged();
  }

  void dispose() {
    _disposed = true;
    _authListener?.cancel();
  }
}

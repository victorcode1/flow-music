import 'dart:async';

import 'package:flow_music/features/account/data/user_data_local_store.dart';
import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/entities/cloud_sync_access.dart';
import 'package:flow_music/features/account/domain/entities/cloud_library_status.dart';
import 'package:flow_music/features/account/domain/entities/synced_user_data.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/account/domain/repositories/cloud_sync_access_repository.dart';
import 'package:flow_music/features/account/domain/repositories/user_data_sync_repository.dart';
import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/repositories/subscription_repository.dart';
import 'package:flutter/foundation.dart';

class UserDataSyncCoordinator {
  UserDataSyncCoordinator(
    this._auth,
    this._remote,
    this._local,
    this._subscriptions,
    this._access, {
    required VoidCallback onLocalDataChanged,
    this.debounce = const Duration(seconds: 2),
  }) : _onLocalDataChanged = onLocalDataChanged;

  final AuthRepository _auth;
  final UserDataSyncRepository _remote;
  final UserDataLocalStore _local;
  final SubscriptionRepository _subscriptions;
  final CloudSyncAccessRepository _access;
  final VoidCallback _onLocalDataChanged;
  final Duration debounce;
  final _states = StreamController<CloudSyncState>.broadcast();
  CloudSyncState _state = CloudSyncState.localOnly;
  SubscriptionAccess _subscription = const SubscriptionAccess.loading();
  CloudSyncAccess _permit = const CloudSyncAccess.denied();
  StreamSubscription<AppUser?>? _authListener;
  StreamSubscription<SubscriptionAccess>? _purchaseListener;
  Future<void> _serial = Future<void>.value();
  Future<void> _localSerial = Future<void>.value();
  Timer? _timer;
  int _epoch = 0;
  int _revision = 0;
  bool _initialized = false;
  bool _disposed = false;
  DateTime? _retryNotBefore;

  CloudSyncState get state => _state;
  Stream<CloudSyncState> watchState() async* {
    yield _state;
    yield* _states.stream;
  }

  Future<void> initialize() async {
    if (_initialized || _disposed) return;
    _initialized = true;
    _authListener = _auth.authStateChanges.listen((_) {
      _epoch++;
      _retryNotBefore = null;
      _permit = const CloudSyncAccess.denied();
      _timer?.cancel();
      unawaited(synchronizeNow());
    });
    _purchaseListener = _subscriptions.watchAccess().listen((access) {
      final changed =
          access.userId != _subscription.userId ||
          access.hasMonthlySubscription !=
              _subscription.hasMonthlySubscription ||
          access.monthlyExpiresAt != _subscription.monthlyExpiresAt;
      _subscription = access;
      if (changed) {
        _permit = const CloudSyncAccess.denied();
        unawaited(synchronizeNow());
      }
    });
    await synchronizeNow();
  }

  Future<void> synchronizeNow() {
    _timer?.cancel();
    return _enqueue(() => _synchronize(verify: true));
  }

  Future<void> favoritesChanged() => _changed(SyncedDataSection.favorites);
  Future<void> playlistsChanged() => _changed(SyncedDataSection.playlists);
  Future<void> preferencesChanged() => _changed(SyncedDataSection.preferences);

  Future<T> editFavorites<T>(Future<T> Function() edit) =>
      _edit(SyncedDataSection.favorites, edit);
  Future<T> editPlaylists<T>(Future<T> Function() edit) =>
      _edit(SyncedDataSection.playlists, edit);
  Future<T> editPreferences<T>(Future<T> Function() edit) =>
      _edit(SyncedDataSection.preferences, edit);

  Future<T> _edit<T>(SyncedDataSection section, Future<T> Function() edit) =>
      _withLocal(() async {
        final result = await edit();
        await _changed(section);
        return result;
      });

  // Local edits only wait for other disk operations, never for the network.
  Future<T> _withLocal<T>(Future<T> Function() operation) {
    final result = _localSerial.then((_) => operation());
    _localSerial = result.then<void>(
      (_) {},
      onError: (Object _, StackTrace _) {},
    );
    return result;
  }

  Future<void> _changed(SyncedDataSection section) async {
    _revision++;
    await _local.markDirty(section);
    if (!_eligible) return;
    _emit(CloudSyncState.pending);
    _timer?.cancel();
    _timer = Timer(debounce, () => unawaited(_enqueue(() => _synchronize())));
  }

  bool get _eligible {
    final id = _auth.currentUser?.id;
    return !_disposed &&
        id != null &&
        _subscription.userId == id &&
        _subscription.isResolved &&
        _subscription.hasMonthlySubscription &&
        (_subscription.monthlyExpiresAt?.isAfter(DateTime.now()) ?? false);
  }

  // Flush only changed sections; never upload an entire stale device snapshot
  // over a newer backup merely because the user is signing out.
  Future<void> flushCurrentUser() => synchronizeNow();

  Future<void> clearLocalUserData() => _enqueue(() async {
    _epoch++;
    _permit = const CloudSyncAccess.denied();
    await _withLocal(_local.clearUserData);
    _emit(CloudSyncState.localOnly);
    _onLocalDataChanged();
  });

  Future<void> deleteLocalAccount(String? userId) => _enqueue(() async {
    await _withLocal(() => _local.deleteAccount(userId));
    _onLocalDataChanged();
  });

  Future<void> _synchronize({bool verify = false}) async {
    if (_disposed) return;
    final userId = _auth.currentUser?.id;
    final epoch = _epoch;
    bool sameSession() =>
        !_disposed && epoch == _epoch && userId == _auth.currentUser?.id;
    bool permitted() => sameSession() && _eligible && _permit.isCurrent;
    try {
      // Switch the local account even when it has no subscription or is offline.
      final switched = await _withLocal(() => _local.switchUser(userId));
      if (switched) _onLocalDataChanged();
      if (!sameSession()) return;
      if (!_eligible || !_remote.isAvailable) {
        _permit = const CloudSyncAccess.denied();
        _emit(CloudSyncState.localOnly);
        return;
      }
      if (_retryNotBefore?.isAfter(DateTime.now()) ?? false) return;
      if (verify || !_permit.isCurrent) {
        _emit(CloudSyncState.verifying);
        final permission = await _access.verify();
        if (!sameSession()) return;
        _permit = permission;
      }
      if (!permitted()) {
        _emit(CloudSyncState.localOnly);
        return;
      }

      final remote = await _remote.fetch(userId!);
      if (!permitted()) return;
      final captured = await _withLocal(
        () async => (
          revision: _revision,
          snapshot: _local.read(),
          baseline: _local.hasCloudBaseline,
          dirty: {
            for (final section in SyncedDataSection.values)
              if (_local.isDirty(section)) section,
          },
        ),
      );
      if (!permitted()) return;
      final revision = captured.revision;
      final local = captured.snapshot;
      final dirty = captured.dirty;
      SyncedUserData merged;
      if (remote == null) {
        merged = local;
        if (local.favorites.isNotEmpty ||
            local.playlists.isNotEmpty ||
            !local.preferences.isEmpty) {
          await _remote.saveSnapshot(userId, local);
        }
      } else if (!captured.baseline) {
        merged = SyncedUserData.mergeGuestData(remote: remote, local: local);
        if (local.favorites.isNotEmpty ||
            local.playlists.isNotEmpty ||
            !local.preferences.isEmpty) {
          await _remote.saveSnapshot(userId, merged);
        }
      } else {
        merged = SyncedUserData(
          favorites: dirty.contains(SyncedDataSection.favorites)
              ? local.favorites
              : remote.favorites,
          playlists: dirty.contains(SyncedDataSection.playlists)
              ? local.playlists
              : remote.playlists,
          preferences: dirty.contains(SyncedDataSection.preferences)
              ? local.preferences
              : remote.preferences,
        );
        for (final section in dirty) {
          if (!permitted()) return;
          switch (section) {
            case SyncedDataSection.favorites:
              await _remote.saveFavorites(userId, local.favorites);
            case SyncedDataSection.playlists:
              await _remote.savePlaylists(userId, local.playlists);
            case SyncedDataSection.preferences:
              await _remote.savePreferences(userId, local.preferences);
          }
        }
      }
      if (!permitted()) return;
      // A local edit during a network request wins on the device and stays dirty.
      await _withLocal(() async {
        if (!permitted()) return;
        if (revision != _revision) {
          _emit(CloudSyncState.pending);
          return;
        }
        await _local.apply(merged);
        await _local.setCloudBaseline();
        await _local.clearAllDirty();
        await _local.recordSuccessfulSync(DateTime.now());
        await _local.archiveCurrent();
        _emit(CloudSyncState.synced);
        _onLocalDataChanged();
      });
    } catch (error) {
      if (sameSession()) {
        _permit = const CloudSyncAccess.denied();
        if (error is CloudLibraryFailure && error.code == 'rate_limited') {
          _retryNotBefore = DateTime.now().add(const Duration(minutes: 5));
          _emit(CloudSyncState.rateLimited);
        } else if (error is CloudLibraryFailure &&
            error.code == 'quota_exceeded') {
          _emit(CloudSyncState.quotaExceeded);
        } else {
          _emit(CloudSyncState.unavailable);
        }
      }
      debugPrint('Cloud sync deferred: ${error.runtimeType}');
    }
  }

  Future<void> _enqueue(Future<void> Function() operation) {
    final result = _serial.then((_) => _disposed ? null : operation());
    _serial = result.catchError((_) {});
    return result;
  }

  void _emit(CloudSyncState state) {
    _state = state;
    if (!_states.isClosed) _states.add(state);
  }

  void dispose() {
    if (_disposed) return;
    _disposed = true;
    _epoch++;
    _timer?.cancel();
    _authListener?.cancel();
    _purchaseListener?.cancel();
    _states.close();
  }
}

class UserDataSyncFailure implements Exception {
  const UserDataSyncFailure(this.message);
  final String message;
  @override
  String toString() => message;
}

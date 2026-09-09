import 'dart:async';
import 'dart:io';

import 'package:flow_music/features/account/application/account_session_actions.dart';
import 'package:flow_music/features/account/application/user_data_sync_coordinator.dart';
import 'package:flow_music/features/account/data/user_data_local_store.dart';
import 'package:flow_music/features/account/data/unavailable_auth_repository.dart';
import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/entities/cloud_sync_access.dart';
import 'package:flow_music/features/account/domain/entities/cloud_library_status.dart';
import 'package:flow_music/features/account/domain/entities/synced_user_data.dart';
import 'package:flow_music/features/account/domain/repositories/cloud_sync_access_repository.dart';
import 'package:flow_music/features/account/domain/repositories/user_data_sync_repository.dart';
import 'package:flow_music/features/monetization/data/unavailable_subscription_repository.dart';
import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';
import 'package:flow_music/features/radio/data/radio_playlists_repository.dart';
import 'package:flow_music/features/settings/data/settings_storage.dart';
import 'package:flow_music/features/settings/data/user_settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

const user = AppUser(id: 'user-1', email: 'one@example.com');
const other = AppUser(id: 'user-2', email: 'two@example.com');
const local = UserDataLocalStore();

void main() {
  late Directory directory;
  late _Auth auth;
  late _Subscriptions subscriptions;
  late _Access permission;
  late _Remote remote;
  late UserDataSyncCoordinator sync;

  Future<void> start({bool paid = true, bool serverAllows = true}) async {
    subscriptions.access = paid
        ? monthly(user.id)
        : const SubscriptionAccess.free();
    permission.allowed = serverAllows;
    await sync.initialize();
    await settle(sync);
  }

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('streambeat_paid_sync_');
    await openStore(directory.path);
    auth = _Auth(user);
    subscriptions = _Subscriptions();
    permission = _Access();
    remote = _Remote();
    sync = UserDataSyncCoordinator(
      auth,
      remote,
      local,
      subscriptions,
      permission,
      onLocalDataChanged: () {},
      debounce: const Duration(days: 1),
    );
  });
  tearDown(() async {
    sync.dispose();
    await auth.changes.close();
    await subscriptions.changes.close();
    await Hive.close();
    await directory.delete(recursive: true);
  });

  test(
    'free login and local favorites/playlists/preferences never use cloud',
    () async {
      await start(paid: false);
      await local.favorites.toggle(station('free'));
      await sync.favoritesChanged();
      await sync.playlistsChanged();
      await sync.preferencesChanged();
      await sync.flushCurrentUser();
      expect(remote.reads, 0);
      expect(remote.writes, 0);
      expect(permission.calls, 0);
      expect(local.read().favorites.single.stationUuid, 'free');
    },
  );

  test(
    'sandbox or unverified monthly purchase cannot create a backup',
    () async {
      await start(serverAllows: false);
      await local.favorites.toggle(station('test-purchase'));
      await sync.favoritesChanged();
      await sync.synchronizeNow();
      expect(permission.calls, greaterThan(0));
      expect(remote.reads, 0);
      expect(remote.writes, 0);
      expect(sync.state, CloudSyncState.localOnly);
    },
  );

  test('lifetime removes ads but never enables cloud by itself', () async {
    subscriptions.access = SubscriptionAccess(
      isResolved: true,
      serviceAvailable: true,
      isActive: true,
      userId: user.id,
      productId: 'remove_ads_lifetime',
    );
    await sync.initialize();
    await settle(sync);
    expect(remote.reads, 0);
    expect(permission.calls, 0);
  });

  test(
    'paid login merges guest favorites and restores playlists once',
    () async {
      await local.favorites.toggle(station('guest'));
      remote.rows[user.id] = snapshot('remote', playlist: true);
      await start();
      expect(
        local.read().favorites.map((x) => x.stationUuid),
        containsAll(['guest', 'remote']),
      );
      expect(local.read().playlists.single.name, 'My radios');
      expect(remote.rows[user.id]!.favorites, hasLength(2));
      final writes = remote.writes;
      await sync.synchronizeNow();
      expect(remote.writes, writes, reason: 'No upload without local changes');
    },
  );

  test(
    'sign out preserves backup and account-local copy, then restores on another device',
    () async {
      remote.rows[user.id] = snapshot('remote', playlist: true);
      await start();
      await AccountSessionActions(auth, sync).signOut();
      expect(local.read().favorites, isEmpty);
      expect(remote.rows[user.id]!.favorites.single.stationUuid, 'remote');

      sync.dispose();
      await Hive.close();
      await openStore('${directory.path}/device-two');
      auth.setUser(user);
      sync = UserDataSyncCoordinator(
        auth,
        remote,
        local,
        subscriptions,
        permission,
        onLocalDataChanged: () {},
        debounce: const Duration(days: 1),
      );
      await sync.initialize();
      await settle(sync);
      expect(local.read().favorites.single.stationUuid, 'remote');
      expect(local.read().playlists.single.items.single.stationUuid, 'remote');
    },
  );

  test('sign out does not overwrite changes from another device', () async {
    remote.rows[user.id] = snapshot('first');
    await start();
    remote.rows[user.id] = snapshot('new-on-second-device');
    final writes = remote.writes;
    await AccountSessionActions(auth, sync).signOut();
    expect(remote.writes, writes);
    expect(
      remote.rows[user.id]!.favorites.single.stationUuid,
      'new-on-second-device',
    );
  });

  test(
    'expired subscription keeps device edits and pauses uploads until renewed',
    () async {
      remote.rows[user.id] = snapshot('old');
      await start();
      subscriptions.emit(const SubscriptionAccess.free());
      await settle(sync);
      final reads = remote.reads;
      final writes = remote.writes;
      await local.favorites.toggle(station('offline-edit'));
      await sync.favoritesChanged();
      await sync.synchronizeNow();
      expect(remote.reads, reads);
      expect(remote.writes, writes);
      expect(local.read().favorites, hasLength(2));
      subscriptions.emit(monthly(user.id));
      await settle(sync);
      expect(remote.rows[user.id]!.favorites, hasLength(2));
    },
  );

  test(
    'server revocation denies SDK access and preserves unsynced edits',
    () async {
      await start();
      permission.allowed = false;
      await local.favorites.toggle(station('local'));
      await sync.favoritesChanged();
      final writes = remote.writes;
      await sync.synchronizeNow();
      expect(remote.writes, writes);
      expect(local.isDirty(SyncedDataSection.favorites), isTrue);
      permission.allowed = true;
      await sync.synchronizeNow();
      expect(remote.rows[user.id]!.favorites.single.stationUuid, 'local');
    },
  );

  test(
    'different free accounts cannot see or upload each other local libraries',
    () async {
      await start(paid: false);
      await local.favorites.toggle(station('private-one'));
      await sync.favoritesChanged();
      auth.setUser(other);
      await settle(sync);
      expect(local.read().favorites, isEmpty);
      await local.favorites.toggle(station('private-two'));
      await sync.favoritesChanged();
      auth.setUser(user);
      await settle(sync);
      expect(local.read().favorites.single.stationUuid, 'private-one');
      expect(remote.writes, 0);
    },
  );

  test(
    'a delayed response for the previous account is never applied to the new account',
    () async {
      await start();
      remote.gate = Completer<void>();
      final pending = sync.synchronizeNow();
      await Future<void>.delayed(Duration.zero);
      auth.setUser(other);
      subscriptions.emit(monthly(other.id));
      remote.gate!.complete();
      remote.gate = null;
      await pending;
      await settle(sync);
      expect(local.ownerId, other.id);
      expect(local.read().favorites, isEmpty);
    },
  );

  test(
    'network failure retains local changes and does not claim a successful backup',
    () async {
      await start();
      remote.fail = true;
      await local.favorites.toggle(station('not-yet-uploaded'));
      await sync.favoritesChanged();
      await sync.synchronizeNow();
      expect(local.isDirty(SyncedDataSection.favorites), isTrue);
      expect(local.read().favorites, hasLength(1));
      expect(sync.state, CloudSyncState.unavailable);
      await AccountSessionActions(auth, sync).signOut();
      auth.setUser(user);
      await settle(sync);
      expect(local.read().favorites, hasLength(1));
    },
  );

  test(
    'rate limit preserves local edits and throttles repeated requests',
    () async {
      await start();
      final last = local.lastSuccessfulSync;
      remote.failureCode = 'rate_limited';
      await local.favorites.toggle(station('pending-limit'));
      await sync.favoritesChanged();
      await sync.synchronizeNow();
      final checks = remote.checks;
      expect(sync.state, CloudSyncState.rateLimited);
      expect(local.isDirty(SyncedDataSection.favorites), isTrue);
      await sync.synchronizeNow();
      expect(remote.checks, checks);
      expect(local.lastSuccessfulSync, last);
      await AccountSessionActions(auth, sync).signOut();
      auth.setUser(user);
      await settle(sync);
      expect(local.read().favorites.single.stationUuid, 'pending-limit');
    },
  );

  test('oversized backup stays local and reports quota failure', () async {
    await start();
    remote.failureCode = 'quota_exceeded';
    await local.favorites.toggle(station('too-large'));
    await sync.favoritesChanged();
    await sync.synchronizeNow();
    expect(sync.state, CloudSyncState.quotaExceeded);
    expect(local.read().favorites.single.stationUuid, 'too-large');
    expect(local.isDirty(SyncedDataSection.favorites), isTrue);
  });

  test('last successful sync belongs to its account only', () async {
    await start();
    final last = local.lastSuccessfulSync;
    expect(last, isNotNull);
    auth.setUser(other);
    await settle(sync);
    expect(local.lastSuccessfulSync, isNull);
    subscriptions.emit(const SubscriptionAccess.free());
    auth.setUser(user);
    await settle(sync);
    expect(local.lastSuccessfulSync, last);
  });

  test('deleting account removes only that account local data', () async {
    await start(paid: false);
    await local.favorites.toggle(station('to-delete'));
    await sync.favoritesChanged();
    await AccountSessionActions(auth, sync).deleteAccount();
    auth.setUser(user);
    await settle(sync);
    expect(local.read().favorites, isEmpty);
  });

  test(
    'editing while an upload is in flight stays responsive and is not erased',
    () async {
      await start();
      await sync.editFavorites(() => local.favorites.toggle(station('first')));
      remote.saveGate = Completer<void>();
      remote.saveStarted = Completer<void>();
      final pending = sync.synchronizeNow();
      await remote.saveStarted!.future;
      await sync
          .editFavorites(() => local.favorites.toggle(station('second')))
          .timeout(const Duration(seconds: 1));
      remote.saveGate!.complete();
      await pending;
      expect(local.read().favorites, hasLength(2));
      expect(local.isDirty(SyncedDataSection.favorites), isTrue);
      expect(sync.state, CloudSyncState.pending);
      await sync.synchronizeNow();
      expect(remote.rows[user.id]!.favorites, hasLength(2));
      expect(local.isDirty(SyncedDataSection.favorites), isFalse);
    },
  );
}

Future<void> openStore(String path) async {
  Hive.init(path);
  await Hive.openBox(settingsBoxName);
  await Hive.openBox(radioFavoritesBoxName);
  await Hive.openBox(radioPlaylistsBoxName);
}

Future<void> settle(UserDataSyncCoordinator sync) async {
  await Future<void>.delayed(Duration.zero);
  await sync.synchronizeNow();
}

SubscriptionAccess monthly(String id) => SubscriptionAccess(
  isResolved: true,
  serviceAvailable: true,
  isActive: true,
  userId: id,
  productId: 'remove_ads_monthly',
  hasMonthlySubscription: true,
  monthlyExpiresAt: DateTime.now().add(const Duration(days: 30)),
);
RadioStation station(String id) => RadioStation.fromJson({
  'stationuuid': id,
  'name': 'Station $id',
  'url': 'https://example.com/$id',
  '__favorited_at': DateTime(2026).toIso8601String(),
});
SyncedUserData snapshot(String id, {bool playlist = false}) => SyncedUserData(
  favorites: [station(id)],
  playlists: playlist
      ? [
          RadioPlaylist(
            id: 'list',
            name: 'My radios',
            createdAt: DateTime(2026),
            updatedAt: DateTime(2026),
            items: [station(id)],
          ),
        ]
      : [],
  preferences: const UserSettings(themeMode: 'dark', updatedAtMs: 1),
);

class _Auth extends UnavailableAuthRepository {
  _Auth(this.value);
  AppUser? value;
  final changes = StreamController<AppUser?>.broadcast();
  @override
  AppUser? get currentUser => value;
  @override
  Stream<AppUser?> get authStateChanges => changes.stream;
  void setUser(AppUser? user) {
    value = user;
    changes.add(user);
  }

  @override
  Future<void> signOut() async => setUser(null);
  @override
  Future<void> deleteAccount() async => setUser(null);
}

class _Subscriptions extends UnavailableSubscriptionRepository {
  SubscriptionAccess access = const SubscriptionAccess.free();
  final changes = StreamController<SubscriptionAccess>.broadcast();
  @override
  Stream<SubscriptionAccess> watchAccess() async* {
    yield access;
    yield* changes.stream;
  }

  void emit(SubscriptionAccess value) {
    access = value;
    changes.add(value);
  }
}

class _Access implements CloudSyncAccessRepository {
  bool allowed = true;
  int calls = 0;
  @override
  Future<CloudSyncAccess> verify() async {
    calls++;
    return CloudSyncAccess(
      allowed: allowed,
      accessUntil: DateTime.now().add(const Duration(hours: 1)),
    );
  }
}

class _Remote implements UserDataSyncRepository {
  final rows = <String, SyncedUserData>{};
  int reads = 0, writes = 0;
  bool fail = false;
  String? failureCode;
  int checks = 0;
  Completer<void>? gate;
  Completer<void>? saveGate;
  Completer<void>? saveStarted;
  @override
  bool get isAvailable => true;
  void check() {
    checks++;
    if (failureCode != null) throw CloudLibraryFailure(failureCode!);
    if (fail) throw StateError('Network offline');
  }

  @override
  Future<SyncedUserData?> fetch(String id) async {
    check();
    reads++;
    await gate?.future;
    return rows[id];
  }

  @override
  Future<void> saveSnapshot(String id, SyncedUserData value) async {
    check();
    writes++;
    if (saveStarted != null && !saveStarted!.isCompleted) {
      saveStarted!.complete();
    }
    await saveGate?.future;
    rows[id] = value;
  }

  @override
  Future<void> saveFavorites(String id, List<RadioStation> value) =>
      saveSnapshot(
        id,
        SyncedUserData(
          favorites: value,
          playlists: rows[id]?.playlists ?? [],
          preferences: rows[id]?.preferences ?? const UserSettings(),
        ),
      );
  @override
  Future<void> savePlaylists(String id, List<RadioPlaylist> value) =>
      saveSnapshot(
        id,
        SyncedUserData(
          favorites: rows[id]?.favorites ?? [],
          playlists: value,
          preferences: rows[id]?.preferences ?? const UserSettings(),
        ),
      );
  @override
  Future<void> savePreferences(String id, UserSettings value) => saveSnapshot(
    id,
    SyncedUserData(
      favorites: rows[id]?.favorites ?? [],
      playlists: rows[id]?.playlists ?? [],
      preferences: value,
    ),
  );
}

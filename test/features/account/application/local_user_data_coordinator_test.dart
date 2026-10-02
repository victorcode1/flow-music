import 'dart:async';
import 'dart:io';

import 'package:flow_music/features/account/application/account_session_actions.dart';
import 'package:flow_music/features/account/application/local_user_data_coordinator.dart';
import 'package:flow_music/features/account/data/user_data_local_store.dart';
import 'package:flow_music/features/account/data/unavailable_auth_repository.dart';
import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/entities/local_user_data.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/account/presentation/providers/local_user_data_providers.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_playlists_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  late LocalUserDataCoordinator coordinator;

  LocalUserDataCoordinator makeCoordinator() =>
      LocalUserDataCoordinator(auth, local, onLocalDataChanged: () {});

  Future<void> openStore(String path) async {
    Hive.init(path);
    await Hive.openBox(settingsBoxName);
    await Hive.openBox(radioFavoritesBoxName);
    await Hive.openBox(radioPlaylistsBoxName);
  }

  Future<void> changeUser(AppUser? value) async {
    auth.setUser(value);
    await coordinator.selectCurrentUser();
  }

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('streambeat_local_');
    await openStore(directory.path);
    auth = _Auth(user);
    coordinator = makeCoordinator();
  });

  tearDown(() async {
    coordinator.dispose();
    await auth.changes.close();
    await Hive.close();
    await directory.delete(recursive: true);
  });

  test(
    'initialization preserves the current legacy library and metadata',
    () async {
      final box = Hive.box(settingsBoxName);
      await box.put('user_data_sync_owner_id', user.id);
      await box.put('user_data_sync_has_cloud_baseline', true);
      await box.put('user_data_sync_dirty_favorites', true);
      await local.apply(snapshot('existing'));

      await coordinator.initialize();

      expect(local.read().favorites.single.stationUuid, 'existing');
      expect(
        local.read().playlists.single.items.single.stationUuid,
        'existing',
      );
      expect(local.read().preferences.locale, 'es');
      expect(box.get('user_data_sync_has_cloud_baseline'), isTrue);
      expect(box.get('user_data_sync_dirty_favorites'), isTrue);
    },
  );

  test(
    'sign out archives locally and sign in restores on this device',
    () async {
      await coordinator.initialize();
      await coordinator.editFavorites(
        () => local.favorites.toggle(station('saved')),
      );
      await coordinator.editPlaylists(
        () => local.playlists.save(playlist('saved')),
      );
      await coordinator.editPreferences(
        () => local.preferences.write(
          const UserSettings(locale: 'es', themeMode: 'dark', updatedAtMs: 1),
        ),
      );

      await AccountSessionActions(auth, coordinator).signOut();
      expect(local.read().favorites, isEmpty);
      expect(local.read().playlists, isEmpty);

      await changeUser(user);
      expect(local.read().favorites.single.stationUuid, 'saved');
      expect(local.read().playlists.single.items.single.stationUuid, 'saved');
      expect(local.read().preferences.locale, 'es');
    },
  );

  test(
    'disk restart retains data without a subscription or remote repository',
    () async {
      await coordinator.initialize();
      await coordinator.editFavorites(
        () => local.favorites.toggle(station('disk')),
      );
      await coordinator.editPlaylists(
        () => local.playlists.save(playlist('disk')),
      );
      await coordinator.editPreferences(
        () => local.preferences.write(
          const UserSettings(locale: 'pt-BR', autoplayEnabled: false),
        ),
      );
      coordinator.dispose();
      await Hive.close();
      await openStore(directory.path);
      coordinator = makeCoordinator();
      await coordinator.initialize();

      expect(local.read().favorites.single.stationUuid, 'disk');
      expect(local.read().playlists.single.items.single.stationUuid, 'disk');
      expect(local.read().preferences.locale, 'pt-BR');
      expect(local.read().preferences.autoplayEnabled, isFalse);
    },
  );

  test('same account on another device has no remote restore', () async {
    await coordinator.initialize();
    await coordinator.editFavorites(
      () => local.favorites.toggle(station('device-one')),
    );
    coordinator.dispose();
    await Hive.close();
    await openStore('${directory.path}/device-two');
    coordinator = makeCoordinator();
    await coordinator.initialize();

    expect(local.read().favorites, isEmpty);
    expect(local.read().playlists, isEmpty);
  });

  test('restores old account archives while ignoring remote fields', () async {
    final data = snapshot('legacy').toJson();
    data['user_id'] = user.id;
    data['updated_at'] = '2026-09-01T00:00:00Z';
    await Hive.box(settingsBoxName).put('user_data_local_account_${user.id}', {
      'snapshot': data,
      'dirty': ['favorites'],
      'baseline': true,
      'last_success': '2026-09-01T00:00:00Z',
    });

    await coordinator.initialize();

    expect(local.read().favorites.single.stationUuid, 'legacy');
    expect(local.read().playlists.single.items.single.stationUuid, 'legacy');
    expect(local.read().preferences.locale, 'es');
  });

  test(
    'an account switch waits for an in-flight local edit without leaking it',
    () async {
      await coordinator.initialize();
      final entered = Completer<void>();
      final release = Completer<void>();
      final edit = coordinator.editFavorites(() async {
        entered.complete();
        await release.future;
        return local.favorites.toggle(station('belongs-to-first'));
      });
      await entered.future;
      auth.setUser(other);
      await Future<void>.delayed(Duration.zero);
      release.complete();
      await edit;
      await coordinator.selectCurrentUser();

      expect(local.ownerId, other.id);
      expect(local.read().favorites, isEmpty);
      await changeUser(user);
      expect(local.read().favorites.single.stationUuid, 'belongs-to-first');
    },
  );

  test(
    'first account adopts guest data without leaking it into other accounts',
    () async {
      auth.setUser(null);
      await coordinator.initialize();
      await coordinator.editFavorites(
        () => local.favorites.toggle(station('guest')),
      );
      await changeUser(user);
      expect(local.read().favorites.single.stationUuid, 'guest');
      await changeUser(other);
      expect(local.read().favorites, isEmpty);
      await changeUser(user);
      expect(local.read().favorites.single.stationUuid, 'guest');
    },
  );

  test(
    'account deletion restores guest data even without an auth notification',
    () async {
      auth.setUser(null);
      await coordinator.initialize();
      await coordinator.editFavorites(
        () => local.favorites.toggle(station('guest')),
      );
      await Hive.box(settingsBoxName).put(
        'user_data_local_account_${user.id}',
        {'snapshot': snapshot('account').toJson()},
      );
      await Hive.box(settingsBoxName).put(
        'user_data_local_account_${other.id}',
        {'snapshot': snapshot('other').toJson()},
      );
      await changeUser(user);

      auth.emitChanges = false;
      await AccountSessionActions(auth, coordinator).deleteAccount();

      expect(local.read().favorites.single.stationUuid, 'guest');
      expect(
        Hive.box(
          settingsBoxName,
        ).containsKey('user_data_local_account_${user.id}'),
        isFalse,
      );
      expect(
        Hive.box(
          settingsBoxName,
        ).containsKey('user_data_local_account_${other.id}'),
        isTrue,
      );
    },
  );

  test('failed deletion or sign out never deletes the local library', () async {
    await coordinator.initialize();
    await coordinator.editFavorites(
      () => local.favorites.toggle(station('preserved')),
    );
    auth.fail = true;
    final actions = AccountSessionActions(auth, coordinator);

    await expectLater(actions.deleteAccount(), throwsA(isA<AuthFailure>()));
    await expectLater(actions.signOut(), throwsA(isA<AuthFailure>()));

    expect(local.ownerId, user.id);
    expect(local.read().favorites.single.stationUuid, 'preserved');
    expect(
      Hive.box(
        settingsBoxName,
      ).containsKey('user_data_local_account_${user.id}'),
      isTrue,
    );
  });

  test(
    'interrupted account switch restores the target before reading live data',
    () async {
      final box = Hive.box(settingsBoxName);
      await box.put('user_data_local_account_${user.id}', {
        'snapshot': snapshot('first').toJson(),
      });
      await box.put('user_data_local_account_${other.id}', {
        'snapshot': snapshot('second').toJson(),
      });
      await box.put('user_data_local_account_guest', {
        'snapshot': snapshot('guest').toJson(),
      });
      await box.put('user_data_local_pending_switch', {
        'user_id': other.id,
        'snapshot': snapshot('second').toJson(),
      });
      // Simulate a crash after clearing the owner and writing part of the target.
      await local.favorites.toggle(station('partial-target'));
      auth.setUser(other);

      await coordinator.initialize();

      expect(local.ownerId, other.id);
      expect(local.read().favorites.single.stationUuid, 'second');
      expect(box.containsKey('user_data_local_pending_switch'), isFalse);
      await changeUser(null);
      expect(local.read().favorites.single.stationUuid, 'guest');
      await changeUser(user);
      expect(local.read().favorites.single.stationUuid, 'first');
    },
  );

  test(
    'interrupted deletion recovers the guest and removes only the deleted archive',
    () async {
      final box = Hive.box(settingsBoxName);
      await box.put('user_data_sync_owner_id', user.id);
      await box.put('user_data_local_account_${user.id}', {
        'snapshot': snapshot('deleted').toJson(),
      });
      await box.put('user_data_local_account_${other.id}', {
        'snapshot': snapshot('other').toJson(),
      });
      await box.put('user_data_local_pending_switch', {
        'user_id': null,
        'snapshot': snapshot('guest').toJson(),
        'deleted_user_id': user.id,
      });
      await local.favorites.toggle(station('partial-deleted'));
      auth.setUser(null);

      await coordinator.initialize();

      expect(local.ownerId, isNull);
      expect(local.read().favorites.single.stationUuid, 'guest');
      expect(box.containsKey('user_data_local_account_${user.id}'), isFalse);
      expect(box.containsKey('user_data_local_account_${other.id}'), isTrue);
      expect(box.containsKey('user_data_local_pending_switch'), isFalse);
    },
  );

  for (final remove in [false, true]) {
    test(
      'playlist ${remove ? 'removal' : 'addition'} cannot copy a previous account into the current one',
      () async {
        await coordinator.initialize();
        await local.apply(snapshot('first'));
        final container = ProviderContainer(
          overrides: [
            localUserDataCoordinatorProvider.overrideWithValue(coordinator),
          ],
        );
        addTearDown(container.dispose);
        final controller = container.read(
          radioPlaylistsControllerProvider.notifier,
        );
        expect(
          container.read(radioPlaylistsControllerProvider).single.id,
          'list-first',
        );
        // Auth changes before the listener has refreshed the visible controller.
        auth.emitChanges = false;
        auth.setUser(other);

        if (remove) {
          await controller.removeStation('list-first', station('first'));
        } else {
          await controller.addStation('list-first', station('new'));
        }

        expect(local.ownerId, other.id);
        expect(local.read().playlists, isEmpty);
        expect(container.read(radioPlaylistsControllerProvider), isEmpty);
        await changeUser(user);
        expect(local.read().playlists.single.items.single.stationUuid, 'first');
      },
    );
  }

  test(
    'creating a playlist with items cannot finish in a different account',
    () async {
      coordinator.dispose();
      final pausedStore = _PausedArchiveStore();
      coordinator = LocalUserDataCoordinator(
        auth,
        pausedStore,
        onLocalDataChanged: () {},
      );
      await coordinator.initialize();
      final container = ProviderContainer(
        overrides: [
          localUserDataCoordinatorProvider.overrideWithValue(coordinator),
        ],
      );
      addTearDown(container.dispose);
      final controller = container.read(
        radioPlaylistsControllerProvider.notifier,
      );
      final creating = controller.createWithItems('New list', [
        station('first'),
      ]);
      await pausedStore.archived.future;
      auth.emitChanges = false;
      auth.setUser(other);
      final result = expectLater(creating, throwsStateError);
      pausedStore.release.complete();
      await result;

      expect(local.ownerId, other.id);
      expect(local.read().playlists, isEmpty);
      await changeUser(user);
      expect(local.read().playlists.single.items, isEmpty);
    },
  );

  test('failed local edit does not poison later writes', () async {
    await coordinator.initialize();
    await expectLater(
      coordinator.editFavorites<void>(
        () async => throw StateError('disk failure'),
      ),
      throwsStateError,
    );
    await coordinator.editFavorites(
      () => local.favorites.toggle(station('later')),
    );
    expect(local.read().favorites.single.stationUuid, 'later');
  });
}

RadioStation station(String id) => RadioStation.fromJson({
  'stationuuid': id,
  'name': 'Station $id',
  'url': 'https://example.com/$id',
  '__favorited_at': DateTime.utc(2026).toIso8601String(),
});

RadioPlaylist playlist(String id) => RadioPlaylist(
  id: 'list-$id',
  name: 'My radios',
  createdAt: DateTime.utc(2026),
  updatedAt: DateTime.utc(2026),
  items: [station(id)],
);

LocalUserData snapshot(String id) => LocalUserData(
  favorites: [station(id)],
  playlists: [playlist(id)],
  preferences: const UserSettings(
    locale: 'es',
    themeMode: 'dark',
    updatedAtMs: 1,
  ),
);

class _Auth extends UnavailableAuthRepository {
  _Auth(this.value);
  AppUser? value;
  bool fail = false;
  bool emitChanges = true;
  final changes = StreamController<AppUser?>.broadcast();

  @override
  AppUser? get currentUser => value;
  @override
  Stream<AppUser?> get authStateChanges => changes.stream;

  void setUser(AppUser? user) {
    value = user;
    if (emitChanges) changes.add(user);
  }

  @override
  Future<void> signOut() async {
    if (fail) throw const AuthFailure('Sign out failed');
    setUser(null);
  }

  @override
  Future<void> deleteAccount() async {
    if (fail) throw const AuthFailure('Delete failed');
    setUser(null);
  }
}

class _PausedArchiveStore extends UserDataLocalStore {
  final archived = Completer<void>();
  final release = Completer<void>();
  bool _pause = true;

  @override
  Future<void> archiveCurrent() async {
    await super.archiveCurrent();
    if (_pause && playlists.readAll().isNotEmpty) {
      _pause = false;
      archived.complete();
      await release.future;
    }
  }
}

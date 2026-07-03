// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(locationService)
final locationServiceProvider = LocationServiceProvider._();

final class LocationServiceProvider
    extends
        $FunctionalProvider<LocationService, LocationService, LocationService>
    with $Provider<LocationService> {
  LocationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationServiceHash();

  @$internal
  @override
  $ProviderElement<LocationService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocationService create(Ref ref) {
    return locationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationService>(value),
    );
  }
}

String _$locationServiceHash() => r'8ebadfabd439074d241f1c8b09b044a977dac984';

@ProviderFor(userLocationRepository)
final userLocationRepositoryProvider = UserLocationRepositoryProvider._();

final class UserLocationRepositoryProvider
    extends
        $FunctionalProvider<
          UserLocationRepository,
          UserLocationRepository,
          UserLocationRepository
        >
    with $Provider<UserLocationRepository> {
  UserLocationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLocationRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLocationRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserLocationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserLocationRepository create(Ref ref) {
    return userLocationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserLocationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserLocationRepository>(value),
    );
  }
}

String _$userLocationRepositoryHash() =>
    r'd168ae7be13f3e020cb98e3343fdd8786bb5d4e8';

@ProviderFor(usersWithLocations)
final usersWithLocationsProvider = UsersWithLocationsProvider._();

final class UsersWithLocationsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserLocationRecord>>,
          List<UserLocationRecord>,
          Stream<List<UserLocationRecord>>
        >
    with
        $FutureModifier<List<UserLocationRecord>>,
        $StreamProvider<List<UserLocationRecord>> {
  UsersWithLocationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersWithLocationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersWithLocationsHash();

  @$internal
  @override
  $StreamProviderElement<List<UserLocationRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<UserLocationRecord>> create(Ref ref) {
    return usersWithLocations(ref);
  }
}

String _$usersWithLocationsHash() =>
    r'8b2e06dda6872a5a6b6c97f52f30cb39df2969ce';

@ProviderFor(globalLocationUpdateInterval)
final globalLocationUpdateIntervalProvider =
    GlobalLocationUpdateIntervalProvider._();

final class GlobalLocationUpdateIntervalProvider
    extends
        $FunctionalProvider<AsyncValue<Duration>, Duration, Stream<Duration>>
    with $FutureModifier<Duration>, $StreamProvider<Duration> {
  GlobalLocationUpdateIntervalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalLocationUpdateIntervalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalLocationUpdateIntervalHash();

  @$internal
  @override
  $StreamProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration> create(Ref ref) {
    return globalLocationUpdateInterval(ref);
  }
}

String _$globalLocationUpdateIntervalHash() =>
    r'dbd3faef7a477414fd0822d6ded6ee2cec3302b1';

@ProviderFor(anonymousUsers)
final anonymousUsersProvider = AnonymousUsersProvider._();

final class AnonymousUsersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserProfileRecord>>,
          List<UserProfileRecord>,
          Stream<List<UserProfileRecord>>
        >
    with
        $FutureModifier<List<UserProfileRecord>>,
        $StreamProvider<List<UserProfileRecord>> {
  AnonymousUsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'anonymousUsersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$anonymousUsersHash();

  @$internal
  @override
  $StreamProviderElement<List<UserProfileRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<UserProfileRecord>> create(Ref ref) {
    return anonymousUsers(ref);
  }
}

String _$anonymousUsersHash() => r'21bbf49246abc052534c43c047548653aa40a9b2';

@ProviderFor(userLocationHistory)
final userLocationHistoryProvider = UserLocationHistoryFamily._();

final class UserLocationHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserLocationHistoryEntry>>,
          List<UserLocationHistoryEntry>,
          Stream<List<UserLocationHistoryEntry>>
        >
    with
        $FutureModifier<List<UserLocationHistoryEntry>>,
        $StreamProvider<List<UserLocationHistoryEntry>> {
  UserLocationHistoryProvider._({
    required UserLocationHistoryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userLocationHistoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userLocationHistoryHash();

  @override
  String toString() {
    return r'userLocationHistoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<UserLocationHistoryEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<UserLocationHistoryEntry>> create(Ref ref) {
    final argument = this.argument as String;
    return userLocationHistory(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserLocationHistoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userLocationHistoryHash() =>
    r'54656fa1371847383442ddd40cb37dd617acaeea';

final class UserLocationHistoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<List<UserLocationHistoryEntry>>,
          String
        > {
  UserLocationHistoryFamily._()
    : super(
        retry: null,
        name: r'userLocationHistoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserLocationHistoryProvider call(String uid) =>
      UserLocationHistoryProvider._(argument: uid, from: this);

  @override
  String toString() => r'userLocationHistoryProvider';
}

@ProviderFor(locationHistoryCleanupSchedule)
final locationHistoryCleanupScheduleProvider =
    LocationHistoryCleanupScheduleProvider._();

final class LocationHistoryCleanupScheduleProvider
    extends
        $FunctionalProvider<
          AsyncValue<LocationHistoryCleanupSchedule>,
          LocationHistoryCleanupSchedule,
          Stream<LocationHistoryCleanupSchedule>
        >
    with
        $FutureModifier<LocationHistoryCleanupSchedule>,
        $StreamProvider<LocationHistoryCleanupSchedule> {
  LocationHistoryCleanupScheduleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationHistoryCleanupScheduleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationHistoryCleanupScheduleHash();

  @$internal
  @override
  $StreamProviderElement<LocationHistoryCleanupSchedule> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<LocationHistoryCleanupSchedule> create(Ref ref) {
    return locationHistoryCleanupSchedule(ref);
  }
}

String _$locationHistoryCleanupScheduleHash() =>
    r'be66331a06512ac87c0e15e52fe91b9f4cf1edef';

@ProviderFor(anonymousUserCleanupConfig)
final anonymousUserCleanupConfigProvider =
    AnonymousUserCleanupConfigProvider._();

final class AnonymousUserCleanupConfigProvider
    extends
        $FunctionalProvider<
          AsyncValue<AnonymousUserCleanupConfig>,
          AnonymousUserCleanupConfig,
          Stream<AnonymousUserCleanupConfig>
        >
    with
        $FutureModifier<AnonymousUserCleanupConfig>,
        $StreamProvider<AnonymousUserCleanupConfig> {
  AnonymousUserCleanupConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'anonymousUserCleanupConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$anonymousUserCleanupConfigHash();

  @$internal
  @override
  $StreamProviderElement<AnonymousUserCleanupConfig> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AnonymousUserCleanupConfig> create(Ref ref) {
    return anonymousUserCleanupConfig(ref);
  }
}

String _$anonymousUserCleanupConfigHash() =>
    r'd17797111ef6f9e472296108ae9013d0ab7bf57b';

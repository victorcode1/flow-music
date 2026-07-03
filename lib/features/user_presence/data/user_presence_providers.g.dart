// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_presence_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userPresenceRepository)
final userPresenceRepositoryProvider = UserPresenceRepositoryProvider._();

final class UserPresenceRepositoryProvider
    extends
        $FunctionalProvider<
          UserPresenceRepository,
          UserPresenceRepository,
          UserPresenceRepository
        >
    with $Provider<UserPresenceRepository> {
  UserPresenceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userPresenceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userPresenceRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserPresenceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserPresenceRepository create(Ref ref) {
    return userPresenceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserPresenceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserPresenceRepository>(value),
    );
  }
}

String _$userPresenceRepositoryHash() =>
    r'8bb096bbbc63527ddc5f7c8032ff906540db1d55';

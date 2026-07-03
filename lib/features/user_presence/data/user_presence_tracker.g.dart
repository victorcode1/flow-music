// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_presence_tracker.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserPresenceTracker)
final userPresenceTrackerProvider = UserPresenceTrackerProvider._();

final class UserPresenceTrackerProvider
    extends $NotifierProvider<UserPresenceTracker, void> {
  UserPresenceTrackerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userPresenceTrackerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userPresenceTrackerHash();

  @$internal
  @override
  UserPresenceTracker create() => UserPresenceTracker();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$userPresenceTrackerHash() =>
    r'7c4b0632000ea65bfec13946157b26596257c4df';

abstract class _$UserPresenceTracker extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

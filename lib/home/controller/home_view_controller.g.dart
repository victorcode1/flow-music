// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeViewController)
const homeViewControllerProvider = HomeViewControllerProvider._();

final class HomeViewControllerProvider
    extends $NotifierProvider<HomeViewController, ViewState> {
  const HomeViewControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'homeViewControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$homeViewControllerHash();

  @$internal
  @override
  HomeViewController create() => HomeViewController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ViewState>(value),
    );
  }
}

String _$homeViewControllerHash() =>
    r'7a2a3bc1f0c7b2ef4896a523bfa3f2fb0610d748';

abstract class _$HomeViewController extends $Notifier<ViewState> {
  ViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ViewState, ViewState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ViewState, ViewState>, ViewState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

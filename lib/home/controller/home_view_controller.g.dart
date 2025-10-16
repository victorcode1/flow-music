// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeView)
const homeViewProvider = HomeViewProvider._();

final class HomeViewProvider extends $NotifierProvider<HomeView, ViewState> {
  const HomeViewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeViewProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeViewHash();

  @$internal
  @override
  HomeView create() => HomeView();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ViewState>(value),
    );
  }
}

String _$homeViewHash() => r'dc3b6841e9d081805dc010cb06372f224d655c5d';

abstract class _$HomeView extends $Notifier<ViewState> {
  ViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ViewState, ViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ViewState, ViewState>,
              ViewState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

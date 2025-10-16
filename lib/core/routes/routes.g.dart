// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Route)
const routeProvider = RouteProvider._();

final class RouteProvider extends $NotifierProvider<Route, GoRouter> {
  const RouteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routeHash();

  @$internal
  @override
  Route create() => Route();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$routeHash() => r'610c6d9532b43f5c1623fbaeeb2aac0eb21ed75a';

abstract class _$Route extends $Notifier<GoRouter> {
  GoRouter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GoRouter, GoRouter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GoRouter, GoRouter>,
              GoRouter,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

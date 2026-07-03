// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Stream notifier que expone el usuario actual al resto de la app. Es la
/// fuente de verdad para gatear navegacion y exponer la sesion HTTP actual.

@ProviderFor(AuthNotifier)
final authProvider = AuthNotifierProvider._();

/// Stream notifier que expone el usuario actual al resto de la app. Es la
/// fuente de verdad para gatear navegacion y exponer la sesion HTTP actual.
final class AuthNotifierProvider
    extends $StreamNotifierProvider<AuthNotifier, AuthUser?> {
  /// Stream notifier que expone el usuario actual al resto de la app. Es la
  /// fuente de verdad para gatear navegacion y exponer la sesion HTTP actual.
  AuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();
}

String _$authNotifierHash() => r'fd150572ed5ebe2df709490c4d8db9b0a76ec14b';

/// Stream notifier que expone el usuario actual al resto de la app. Es la
/// fuente de verdad para gatear navegacion y exponer la sesion HTTP actual.

abstract class _$AuthNotifier extends $StreamNotifier<AuthUser?> {
  Stream<AuthUser?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthUser?>, AuthUser?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthUser?>, AuthUser?>,
              AsyncValue<AuthUser?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

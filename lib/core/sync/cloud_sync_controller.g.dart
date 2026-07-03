// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_sync_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Registro de unidades sincronizables. Para sumar una feature nueva al
/// ciclo (favoritos, playlists, settings, etc.), basta con exponer un
/// provider que devuelva su `Syncable` y agregarlo a esta lista.

@ProviderFor(cloudSyncRegistry)
final cloudSyncRegistryProvider = CloudSyncRegistryProvider._();

/// Registro de unidades sincronizables. Para sumar una feature nueva al
/// ciclo (favoritos, playlists, settings, etc.), basta con exponer un
/// provider que devuelva su `Syncable` y agregarlo a esta lista.

final class CloudSyncRegistryProvider
    extends $FunctionalProvider<List<Syncable>, List<Syncable>, List<Syncable>>
    with $Provider<List<Syncable>> {
  /// Registro de unidades sincronizables. Para sumar una feature nueva al
  /// ciclo (favoritos, playlists, settings, etc.), basta con exponer un
  /// provider que devuelva su `Syncable` y agregarlo a esta lista.
  CloudSyncRegistryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cloudSyncRegistryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cloudSyncRegistryHash();

  @$internal
  @override
  $ProviderElement<List<Syncable>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Syncable> create(Ref ref) {
    return cloudSyncRegistry(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Syncable> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Syncable>>(value),
    );
  }
}

String _$cloudSyncRegistryHash() => r'425f414c09bf9710b0abe17429bd8a825066f796';

/// Orquesta el ciclo de sincronizacion. Cuando el usuario inicia sesion,
/// dispara un pull completo (remoto -> local). Tambien expone `pushAll` y
/// `pushOne` para los controllers de feature.

@ProviderFor(CloudSyncController)
final cloudSyncControllerProvider = CloudSyncControllerProvider._();

/// Orquesta el ciclo de sincronizacion. Cuando el usuario inicia sesion,
/// dispara un pull completo (remoto -> local). Tambien expone `pushAll` y
/// `pushOne` para los controllers de feature.
final class CloudSyncControllerProvider
    extends $NotifierProvider<CloudSyncController, CloudSyncState> {
  /// Orquesta el ciclo de sincronizacion. Cuando el usuario inicia sesion,
  /// dispara un pull completo (remoto -> local). Tambien expone `pushAll` y
  /// `pushOne` para los controllers de feature.
  CloudSyncControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cloudSyncControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cloudSyncControllerHash();

  @$internal
  @override
  CloudSyncController create() => CloudSyncController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CloudSyncState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CloudSyncState>(value),
    );
  }
}

String _$cloudSyncControllerHash() =>
    r'd7b99253368b5f09a25c17ddaf0af8d489f748ca';

/// Orquesta el ciclo de sincronizacion. Cuando el usuario inicia sesion,
/// dispara un pull completo (remoto -> local). Tambien expone `pushAll` y
/// `pushOne` para los controllers de feature.

abstract class _$CloudSyncController extends $Notifier<CloudSyncState> {
  CloudSyncState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CloudSyncState, CloudSyncState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CloudSyncState, CloudSyncState>,
              CloudSyncState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

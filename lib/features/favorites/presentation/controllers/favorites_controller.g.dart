// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier que expone la lista actual de favoritos y permite agregar /
/// quitar canciones.
///
/// La lista se carga sincronicamente desde Hive en `build` porque la caja
/// se abre antes de `runApp` (ver `main.dart`). Cuando hay usuario
/// autenticado, cada mutacion empuja best-effort la copia completa a
/// Firestore; tras un pull remoto, el controller re-lee Hive para reflejar
/// los datos sincronizados.

@ProviderFor(FavoritesController)
final favoritesControllerProvider = FavoritesControllerProvider._();

/// Notifier que expone la lista actual de favoritos y permite agregar /
/// quitar canciones.
///
/// La lista se carga sincronicamente desde Hive en `build` porque la caja
/// se abre antes de `runApp` (ver `main.dart`). Cuando hay usuario
/// autenticado, cada mutacion empuja best-effort la copia completa a
/// Firestore; tras un pull remoto, el controller re-lee Hive para reflejar
/// los datos sincronizados.
final class FavoritesControllerProvider
    extends $NotifierProvider<FavoritesController, List<FavoriteSong>> {
  /// Notifier que expone la lista actual de favoritos y permite agregar /
  /// quitar canciones.
  ///
  /// La lista se carga sincronicamente desde Hive en `build` porque la caja
  /// se abre antes de `runApp` (ver `main.dart`). Cuando hay usuario
  /// autenticado, cada mutacion empuja best-effort la copia completa a
  /// Firestore; tras un pull remoto, el controller re-lee Hive para reflejar
  /// los datos sincronizados.
  FavoritesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesControllerHash();

  @$internal
  @override
  FavoritesController create() => FavoritesController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<FavoriteSong> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<FavoriteSong>>(value),
    );
  }
}

String _$favoritesControllerHash() =>
    r'724b0cc77c5d473b28b93207a56fdd90a481261f';

/// Notifier que expone la lista actual de favoritos y permite agregar /
/// quitar canciones.
///
/// La lista se carga sincronicamente desde Hive en `build` porque la caja
/// se abre antes de `runApp` (ver `main.dart`). Cuando hay usuario
/// autenticado, cada mutacion empuja best-effort la copia completa a
/// Firestore; tras un pull remoto, el controller re-lee Hive para reflejar
/// los datos sincronizados.

abstract class _$FavoritesController extends $Notifier<List<FavoriteSong>> {
  List<FavoriteSong> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<FavoriteSong>, List<FavoriteSong>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<FavoriteSong>, List<FavoriteSong>>,
              List<FavoriteSong>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

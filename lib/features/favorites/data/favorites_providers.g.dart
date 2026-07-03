// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider del sync de favoritos. Vive en `data/` y NO importa controllers
/// para evitar ciclos: la registry global y el controller lo consumen, no
/// al reves.

@ProviderFor(favoritesSync)
final favoritesSyncProvider = FavoritesSyncProvider._();

/// Provider del sync de favoritos. Vive en `data/` y NO importa controllers
/// para evitar ciclos: la registry global y el controller lo consumen, no
/// al reves.

final class FavoritesSyncProvider
    extends $FunctionalProvider<FavoritesSync, FavoritesSync, FavoritesSync>
    with $Provider<FavoritesSync> {
  /// Provider del sync de favoritos. Vive en `data/` y NO importa controllers
  /// para evitar ciclos: la registry global y el controller lo consumen, no
  /// al reves.
  FavoritesSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesSyncHash();

  @$internal
  @override
  $ProviderElement<FavoritesSync> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FavoritesSync create(Ref ref) {
    return favoritesSync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavoritesSync value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavoritesSync>(value),
    );
  }
}

String _$favoritesSyncHash() => r'7e7bf14af60240196085640c133c215c09419b97';

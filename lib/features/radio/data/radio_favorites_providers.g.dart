// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_favorites_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(radioFavoritesSync)
final radioFavoritesSyncProvider = RadioFavoritesSyncProvider._();

final class RadioFavoritesSyncProvider
    extends
        $FunctionalProvider<
          RadioFavoritesSync,
          RadioFavoritesSync,
          RadioFavoritesSync
        >
    with $Provider<RadioFavoritesSync> {
  RadioFavoritesSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'radioFavoritesSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$radioFavoritesSyncHash();

  @$internal
  @override
  $ProviderElement<RadioFavoritesSync> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RadioFavoritesSync create(Ref ref) {
    return radioFavoritesSync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioFavoritesSync value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioFavoritesSync>(value),
    );
  }
}

String _$radioFavoritesSyncHash() =>
    r'9bd13c30b7872bd300173089269e84454a5dc892';

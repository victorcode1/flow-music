// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_playlists_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(radioPlaylistsSync)
final radioPlaylistsSyncProvider = RadioPlaylistsSyncProvider._();

final class RadioPlaylistsSyncProvider
    extends
        $FunctionalProvider<
          RadioPlaylistsSync,
          RadioPlaylistsSync,
          RadioPlaylistsSync
        >
    with $Provider<RadioPlaylistsSync> {
  RadioPlaylistsSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'radioPlaylistsSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$radioPlaylistsSyncHash();

  @$internal
  @override
  $ProviderElement<RadioPlaylistsSync> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RadioPlaylistsSync create(Ref ref) {
    return radioPlaylistsSync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioPlaylistsSync value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioPlaylistsSync>(value),
    );
  }
}

String _$radioPlaylistsSyncHash() =>
    r'238f3fb18b4c85a4250df443e42745fe75db8fc6';

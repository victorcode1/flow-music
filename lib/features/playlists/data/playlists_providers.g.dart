// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlists_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playlistsSync)
final playlistsSyncProvider = PlaylistsSyncProvider._();

final class PlaylistsSyncProvider
    extends $FunctionalProvider<PlaylistsSync, PlaylistsSync, PlaylistsSync>
    with $Provider<PlaylistsSync> {
  PlaylistsSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistsSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistsSyncHash();

  @$internal
  @override
  $ProviderElement<PlaylistsSync> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlaylistsSync create(Ref ref) {
    return playlistsSync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaylistsSync value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaylistsSync>(value),
    );
  }
}

String _$playlistsSyncHash() => r'4ef429b811f13a0ba5f0933118e450e54dbd4ea0';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_song_id.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playSongIdHash() => r'a7a8dcff0d721e0da2fa56ebe9ef07c9700986fe';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PlaySongId
    extends BuildlessAutoDisposeAsyncNotifier<SongIdResponde?> {
  late final String songId;

  FutureOr<SongIdResponde?> build({
    required String songId,
  });
}

/// See also [PlaySongId].
@ProviderFor(PlaySongId)
const playSongIdProvider = PlaySongIdFamily();

/// See also [PlaySongId].
class PlaySongIdFamily extends Family<AsyncValue<SongIdResponde?>> {
  /// See also [PlaySongId].
  const PlaySongIdFamily();

  /// See also [PlaySongId].
  PlaySongIdProvider call({
    required String songId,
  }) {
    return PlaySongIdProvider(
      songId: songId,
    );
  }

  @override
  PlaySongIdProvider getProviderOverride(
    covariant PlaySongIdProvider provider,
  ) {
    return call(
      songId: provider.songId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'playSongIdProvider';
}

/// See also [PlaySongId].
class PlaySongIdProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PlaySongId, SongIdResponde?> {
  /// See also [PlaySongId].
  PlaySongIdProvider({
    required String songId,
  }) : this._internal(
          () => PlaySongId()..songId = songId,
          from: playSongIdProvider,
          name: r'playSongIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playSongIdHash,
          dependencies: PlaySongIdFamily._dependencies,
          allTransitiveDependencies:
              PlaySongIdFamily._allTransitiveDependencies,
          songId: songId,
        );

  PlaySongIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.songId,
  }) : super.internal();

  final String songId;

  @override
  FutureOr<SongIdResponde?> runNotifierBuild(
    covariant PlaySongId notifier,
  ) {
    return notifier.build(
      songId: songId,
    );
  }

  @override
  Override overrideWith(PlaySongId Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlaySongIdProvider._internal(
        () => create()..songId = songId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        songId: songId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PlaySongId, SongIdResponde?>
      createElement() {
    return _PlaySongIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaySongIdProvider && other.songId == songId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, songId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlaySongIdRef on AutoDisposeAsyncNotifierProviderRef<SongIdResponde?> {
  /// The parameter `songId` of this provider.
  String get songId;
}

class _PlaySongIdProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PlaySongId, SongIdResponde?>
    with PlaySongIdRef {
  _PlaySongIdProviderElement(super.provider);

  @override
  String get songId => (origin as PlaySongIdProvider).songId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_song_id.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlaySongId)
const playSongIdProvider = PlaySongIdFamily._();

final class PlaySongIdProvider
    extends $AsyncNotifierProvider<PlaySongId, SongIdResponde?> {
  const PlaySongIdProvider._({
    required PlaySongIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'playSongIdProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playSongIdHash();

  @override
  String toString() {
    return r'playSongIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PlaySongId create() => PlaySongId();

  @override
  bool operator ==(Object other) {
    return other is PlaySongIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playSongIdHash() => r'9ddbc14d855f952e6f509105c1f0f0a65ab98f47';

final class PlaySongIdFamily extends $Family
    with
        $ClassFamilyOverride<
          PlaySongId,
          AsyncValue<SongIdResponde?>,
          SongIdResponde?,
          FutureOr<SongIdResponde?>,
          String
        > {
  const PlaySongIdFamily._()
    : super(
        retry: null,
        name: r'playSongIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PlaySongIdProvider call({required String songId}) =>
      PlaySongIdProvider._(argument: songId, from: this);

  @override
  String toString() => r'playSongIdProvider';
}

abstract class _$PlaySongId extends $AsyncNotifier<SongIdResponde?> {
  late final _$args = ref.$arg as String;
  String get songId => _$args;

  FutureOr<SongIdResponde?> build({required String songId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(songId: _$args);
    final ref = this.ref as $Ref<AsyncValue<SongIdResponde?>, SongIdResponde?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SongIdResponde?>, SongIdResponde?>,
              AsyncValue<SongIdResponde?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

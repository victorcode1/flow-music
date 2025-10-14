// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AudioPlayerProvider)
const audioPlayerProviderProvider = AudioPlayerProviderProvider._();

final class AudioPlayerProviderProvider
    extends $NotifierProvider<AudioPlayerProvider, AudioPlayer> {
  const AudioPlayerProviderProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'audioPlayerProviderProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$audioPlayerProviderHash();

  @$internal
  @override
  AudioPlayerProvider create() => AudioPlayerProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudioPlayer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudioPlayer>(value),
    );
  }
}

String _$audioPlayerProviderHash() =>
    r'0129bcb19cf456d41400fb0c1748ac05d4bd927c';

abstract class _$AudioPlayerProvider extends $Notifier<AudioPlayer> {
  AudioPlayer build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AudioPlayer, AudioPlayer>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AudioPlayer, AudioPlayer>, AudioPlayer, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

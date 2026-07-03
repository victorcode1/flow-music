// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autoplay_queue_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the search-results queue and pre-resolved audio URLs / cached files.
///
/// When a search result is tapped, the parent calls [enqueue] with the full
/// result list and the tapped index. The queue keeps the tapped track as
/// `current` and the surrounding tracks as `played` (before) and `upcoming`
/// (after), then kicks off parallel resolution + caching for the first few
/// upcoming items so next/prev navigation is instant.

@ProviderFor(AutoplayQueueController)
final autoplayQueueControllerProvider = AutoplayQueueControllerProvider._();

/// Holds the search-results queue and pre-resolved audio URLs / cached files.
///
/// When a search result is tapped, the parent calls [enqueue] with the full
/// result list and the tapped index. The queue keeps the tapped track as
/// `current` and the surrounding tracks as `played` (before) and `upcoming`
/// (after), then kicks off parallel resolution + caching for the first few
/// upcoming items so next/prev navigation is instant.
final class AutoplayQueueControllerProvider
    extends $NotifierProvider<AutoplayQueueController, AutoplayQueueState> {
  /// Holds the search-results queue and pre-resolved audio URLs / cached files.
  ///
  /// When a search result is tapped, the parent calls [enqueue] with the full
  /// result list and the tapped index. The queue keeps the tapped track as
  /// `current` and the surrounding tracks as `played` (before) and `upcoming`
  /// (after), then kicks off parallel resolution + caching for the first few
  /// upcoming items so next/prev navigation is instant.
  AutoplayQueueControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoplayQueueControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoplayQueueControllerHash();

  @$internal
  @override
  AutoplayQueueController create() => AutoplayQueueController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AutoplayQueueState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AutoplayQueueState>(value),
    );
  }
}

String _$autoplayQueueControllerHash() =>
    r'eee80457281681fe3b719ea8a4dbce80f45c470c';

/// Holds the search-results queue and pre-resolved audio URLs / cached files.
///
/// When a search result is tapped, the parent calls [enqueue] with the full
/// result list and the tapped index. The queue keeps the tapped track as
/// `current` and the surrounding tracks as `played` (before) and `upcoming`
/// (after), then kicks off parallel resolution + caching for the first few
/// upcoming items so next/prev navigation is instant.

abstract class _$AutoplayQueueController extends $Notifier<AutoplayQueueState> {
  AutoplayQueueState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AutoplayQueueState, AutoplayQueueState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AutoplayQueueState, AutoplayQueueState>,
              AutoplayQueueState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

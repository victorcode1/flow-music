// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Search)
const searchProvider = SearchProvider._();

final class SearchProvider extends $NotifierProvider<Search, String?> {
  const SearchProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchHash();

  @$internal
  @override
  Search create() => Search();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$searchHash() => r'2a97ec182fb2934fe9b35aede321dc48e5baa8a2';

abstract class _$Search extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String?, String?>, String?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

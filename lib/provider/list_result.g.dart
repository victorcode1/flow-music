// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_result.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(searchData)
const searchDataProvider = SearchDataProvider._();

final class SearchDataProvider extends $FunctionalProvider<
        AsyncValue<SearchResult?>, SearchResult?, FutureOr<SearchResult?>>
    with $FutureModifier<SearchResult?>, $FutureProvider<SearchResult?> {
  const SearchDataProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchDataProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchDataHash();

  @$internal
  @override
  $FutureProviderElement<SearchResult?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SearchResult?> create(Ref ref) {
    return searchData(ref);
  }
}

String _$searchDataHash() => r'11912d3dc2d65e43732e30a9d5fdb48d4ed7e814';

@ProviderFor(SearchDataReq)
const searchDataReqProvider = SearchDataReqProvider._();

final class SearchDataReqProvider
    extends $AsyncNotifierProvider<SearchDataReq, SearchResult?> {
  const SearchDataReqProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchDataReqProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchDataReqHash();

  @$internal
  @override
  SearchDataReq create() => SearchDataReq();
}

String _$searchDataReqHash() => r'7560cc809de0fc436a94d11c1e8fc9883f14def4';

abstract class _$SearchDataReq extends $AsyncNotifier<SearchResult?> {
  FutureOr<SearchResult?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SearchResult?>, SearchResult?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SearchResult?>, SearchResult?>,
        AsyncValue<SearchResult?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

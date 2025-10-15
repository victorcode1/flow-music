// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_quick_search_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchDataReq)
const searchDataReqProvider = SearchDataReqFamily._();

final class SearchDataReqProvider
    extends $AsyncNotifierProvider<SearchDataReq, SearchResult?> {
  const SearchDataReqProvider._(
      {required SearchDataReqFamily super.from,
      required String? super.argument})
      : super(
          retry: null,
          name: r'searchDataReqProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchDataReqHash();

  @override
  String toString() {
    return r'searchDataReqProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SearchDataReq create() => SearchDataReq();

  @override
  bool operator ==(Object other) {
    return other is SearchDataReqProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchDataReqHash() => r'3f46a8170b5edd73619c9ea1f1d149fbb62678b7';

final class SearchDataReqFamily extends $Family
    with
        $ClassFamilyOverride<SearchDataReq, AsyncValue<SearchResult?>,
            SearchResult?, FutureOr<SearchResult?>, String?> {
  const SearchDataReqFamily._()
      : super(
          retry: null,
          name: r'searchDataReqProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SearchDataReqProvider call({
    required String? search,
  }) =>
      SearchDataReqProvider._(argument: search, from: this);

  @override
  String toString() => r'searchDataReqProvider';
}

abstract class _$SearchDataReq extends $AsyncNotifier<SearchResult?> {
  late final _$args = ref.$arg as String?;
  String? get search => _$args;

  FutureOr<SearchResult?> build({
    required String? search,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      search: _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<SearchResult?>, SearchResult?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SearchResult?>, SearchResult?>,
        AsyncValue<SearchResult?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

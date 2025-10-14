// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_search_result.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(searchResultData)
const searchResultDataProvider = SearchResultDataFamily._();

final class SearchResultDataProvider extends $FunctionalProvider<
        AsyncValue<ListSearchResult?>,
        ListSearchResult?,
        FutureOr<ListSearchResult?>>
    with
        $FutureModifier<ListSearchResult?>,
        $FutureProvider<ListSearchResult?> {
  const SearchResultDataProvider._(
      {required SearchResultDataFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'searchResultDataProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchResultDataHash();

  @override
  String toString() {
    return r'searchResultDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ListSearchResult?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ListSearchResult?> create(Ref ref) {
    final argument = this.argument as String;
    return searchResultData(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchResultDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchResultDataHash() => r'f2466ea07aa54e7e5a09cc7758446def573f99ef';

final class SearchResultDataFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ListSearchResult?>, String> {
  const SearchResultDataFamily._()
      : super(
          retry: null,
          name: r'searchResultDataProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  SearchResultDataProvider call(
    String search,
  ) =>
      SearchResultDataProvider._(argument: search, from: this);

  @override
  String toString() => r'searchResultDataProvider';
}

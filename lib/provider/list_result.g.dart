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

String _$searchDataHash() => r'3c9810d1277870f84bf405e06b0d99220ddfe389';

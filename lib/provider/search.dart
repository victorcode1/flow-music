import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search.g.dart';

@riverpod
class Search extends _$Search {
  @override
  String build() {
    return '';
  }

  setValue(String query) {
    state = query;
  }
}
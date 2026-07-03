import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_search.g.dart';

@Riverpod(keepAlive: true)
class Search extends _$Search {
  @override
  Raw<TextEditingController> build() {
    return TextEditingController();
  }

  void setValue(String query) {
    state.text = query;
  }
}

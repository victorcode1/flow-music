import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_controller.g.dart';

sealed class ViewState {
  final String? data;
  const ViewState(this.data);
  factory ViewState.listSong({String? data}) = ListSong;
  factory ViewState.child({String? data}) = Child;
}

class ListSong extends ViewState {
  const ListSong({String? data}) : super(data);
}

class Child extends ViewState {
  const Child({String? data}) : super(data);
}

@riverpod
class HomeViewController extends _$HomeViewController {
  @override
  ViewState build() {
    return ViewState.listSong();
  }

  Widget? buildView({required Widget Function(ViewState data) page}) {
    return page(state);
  }

  void setQuey(String p1) {
    state = ViewState.listSong(data: p1);
  }
}

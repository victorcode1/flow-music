import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_controller.g.dart';

sealed class ViewState {
  const ViewState();

  factory ViewState.quickListSong({String? data}) = QuickListSong;
  factory ViewState.listSong({String? query}) = ListSong;
  factory ViewState.suggested() = Suggested;
}

class ListSong extends ViewState {
  final String? query;
  const ListSong({this.query});
}

class QuickListSong extends ViewState {
  final String? data;
  const QuickListSong({this.data});
}

class Suggested extends ViewState {
  const Suggested({String? data});
}

@Riverpod(keepAlive: true)
class HomeView extends _$HomeView {
  Timer? _debounce;

  @override
  ViewState build() {
    return ViewState.suggested();
  }

  void setQuery(String p1) {
    if (p1.isEmpty) {
      state = ViewState.suggested();
    } else {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 600), () {
        if (p1.isNotEmpty) {
          state = ViewState.quickListSong(data: p1);
        }
      });
    }
  }

  void showListSearch(String p1) {
    if (p1.isNotEmpty) {
      state = ViewState.listSong(query: p1);
    }
  }
}

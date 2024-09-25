import 'dart:async';

import 'package:flow_music/core/const/roots/rutas.dart';
import 'package:flow_music/datasource/model/search_result.dart';
import 'package:flow_music/domain/implements/general.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appBarController = ChangeNotifierProvider<AppBarConTroller>(
    (ref) => AppBarConTroller(ref: ref));

class AppBarConTroller extends ChangeNotifier {
  ChangeNotifierProviderRef ref;
  Timer? debounce;
  late AnimationController _animationController;
  late final GeneralImplement _domain;
  final _focusNode = FocusNode();
  final _searchController = TextEditingController();

  AppBarConTroller({required this.ref}) {
    _domain = GeneralImplement();
  }

  TextEditingController get searchController => _searchController;

  FocusNode get focusNode => _focusNode;

  void initAppBar({required TickerProvider tickerProvider}) {
    _animationController = AnimationController(
        vsync: tickerProvider, duration: const Duration(milliseconds: 300));
  }

  void openDrawer({required BuildContext context}) {
    if (_animationController.isCompleted) {
      _animationController.reverse();
      chageViewContet(context: context);
    } else {
      Scaffold.of(context).openDrawer();
    }
  }

  AnimationController get animationController => _animationController;

  void searchAppBar({required String query, required BuildContext context}) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 1000), () {
      searchController.text = query;
      context.go(RutasShelf.searchAppBar.rootValue);
      notifyListeners();
    });
  }

  void chageViewContet({required BuildContext context}) {
    // contractView?.content(view: const SizedBox());
    context.go(RutasShelf.searchAppBar.rootValue);
    notifyListeners();
  }

  Future<SearchResult?> getListResult({required String query}) async =>
      await _domain.getListResult(query: query);

  void deleteContentSearch() {
    searchController.clear();
    notifyListeners();
  }

  Future<void> authenticante({required BuildContext context}) async {
    // context.go(RutasShelf.auth.rootValue);
    if (!_animationController.isCompleted) {
      //contractView?.content(view: const AuthPage());
      context.go(RutasShelf.auth.rootValue);
      // notifyListeners();
      _animationController.forward();
      await Future.delayed(const Duration(microseconds: 800));
    } else {
      _animationController.reverse();
      await Future.delayed(const Duration(microseconds: 800));
      //contractView?.content(view: const SizedBox());
      context.go(RutasShelf.searchAppBar.rootValue);
    }
    notifyListeners();
  }
}

import 'dart:async';

import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/core/const/roots/rutas.dart';
import 'package:flow_music/datasource/model/search_result.dart';
import 'package:flow_music/domain/repository/geneal_repo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appBarController = ChangeNotifierProvider<AppBarConTroller>((ref) {
  final implement = ref.read(mainController).implement;
  return AppBarConTroller(ref: ref, implement: implement);
});

class AppBarConTroller extends ChangeNotifier {
  ChangeNotifierProviderRef ref;
  Timer? debounce;
  late AnimationController _animationController;
  final GenealRepo implement;
  final _focusNode = FocusNode();
  final _searchController = TextEditingController();

  AppBarConTroller({required this.ref, required this.implement});

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

  Future<String?> get imagenPerl => implement.userRepository.imagenPerfil;

  void searchAppBar({required String query, required BuildContext context}) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 1000), () {
      searchController.text = query;
      context.push(RutasShelf.searchAppBar.rootValue);
      notifyListeners();
    });
  }

  void chageViewContet({required BuildContext context}) {
    // contractView?.content(view: const SizedBox());
    context.pop();
  }

  Future<SearchResult?> getListResult({required String query}) async =>
      await implement.httpRepo.searchAppBarDataRepo.getListSearch(query: query);

  void deleteContentSearch() {
    searchController.clear();
    notifyListeners();
  }

  Future<void> authenticante({required BuildContext context}) async {
    // context.go(RutasShelf.auth.rootValue);
    if (!_animationController.isCompleted) {
      //contractView?.content(view: const AuthPage());
      context.push(RutasShelf.auth.rootValue);
      // notifyListeners();
      _animationController.forward();
      await Future.delayed(const Duration(microseconds: 800));
    } else {
      _animationController.reverse();
      await Future.delayed(const Duration(microseconds: 800));
      //contractView?.content(view: const SizedBox());
      if (context.mounted) context.push(RutasShelf.searchAppBar.rootValue);
    }
  }
}

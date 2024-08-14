import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarCon {
  Timer? debounce;
  final FocusNode focusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  void searchAppBar(
      {required String query,
      required BuildContext context,
      required void Function() refresh}) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 1000), () {
      context.go('/search');
      searchController.text = query;
      refresh();
    });
  }
}

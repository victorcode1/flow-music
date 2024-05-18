import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final controllerPageBuilder = ChangeNotifierProvider<ControllerPageBuilder>(
    (ref) => ControllerPageBuilder(ref: ref));

class ControllerPageBuilder extends ChangeNotifier {
  ChangeNotifierProviderRef ref;

  ControllerPageBuilder({required this.ref});

  search({required BuildContext context, required SearchDelegate delegate}) {
    showSearch(context: context, delegate: delegate);
  }
}

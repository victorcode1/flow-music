import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';

final controllerPageBuilder = ChangeNotifierProvider<ControllerPageBuilder>(
    (ref) => ControllerPageBuilder(ref: ref));

class ControllerPageBuilder extends ChangeNotifier {
  Ref ref;

  ControllerPageBuilder({required this.ref});

 void search({required BuildContext context, required SearchDelegate delegate}) {
    showSearch(context: context, delegate: delegate);
  }
}

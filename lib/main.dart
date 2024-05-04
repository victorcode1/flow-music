import 'package:flow_music/settings/utils/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(mainController);
    return MaterialApp.router(
      routerConfig: controller.router,
      builder: (context, child) {
        return ScaffoldMessenger(
            key: controller.scaffoldMessage, child: child ?? const SizedBox());
      },
    );
  }
}

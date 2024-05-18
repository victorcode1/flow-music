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

class _MainAppState extends ConsumerState<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        ref.read(mainController).setAudioStateDetached();
      case AppLifecycleState.resumed:
        ref.read(mainController).setAudioStateResumed();
        break;
      case AppLifecycleState.inactive:
        ref.read(mainController).setAudioStateInactive();
        break;
      case AppLifecycleState.paused:
        ref.read(mainController).setAudioStatePaused();
        break;

      case AppLifecycleState.hidden:
        ref.read(mainController).setAudioStateHidden();
        break;
    }
  }

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

import 'package:firebase_core/firebase_core.dart';
import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/firebase_options.dart';
import 'package:flow_music/pages/shared/seek_bar/seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({
    super.key,
  });

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    ref.read(mainController).init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint('AppLifecycleState: $state');
    switch (state) {
      case AppLifecycleState.detached:
        ref.read(mainController).setAudioStateDetached();
      case AppLifecycleState.resumed:
        // ref.read(mainController).setAudioStateResumed();
        break;
      case AppLifecycleState.inactive:
        // ref.read(mainController).setAudioStateResumed();
        break;
      case AppLifecycleState.paused:
        // ref.read(mainController).setAudioStatePaused();
        break;

      case AppLifecycleState.hidden:
        // ref.read(mainController).setAudioStateHidden();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(mainController);
    return MaterialApp.router(
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color.fromRGBO(13, 32, 80, 1.0)),
      debugShowCheckedModeBanner: false,
      routerConfig: controller.router,
      builder: (context, child) {
        return ScaffoldMessenger(
            key: controller.scaffoldMessage, child: child ?? const SizedBox());
      },
    );
  }
}

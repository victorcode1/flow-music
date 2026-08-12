import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/app/main_app_controller.dart';
import 'package:flow_music/core/routes/routes.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/core/utils/main_controller.dart';
import 'package:flow_music/features/settings/presentation/controllers/accent_color_controller.dart';
import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart';
import 'package:flow_music/shared/widgets/flow_ambient_background.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  late final MainAppController _appController;

  @override
  void initState() {
    super.initState();
    _appController = ref.read(mainAppControllerProvider);
    _appController.initialize();
  }

  @override
  void dispose() {
    _appController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(mainController);
    final router = ref.read(routeProvider);
    final themeMode = ref.watch(themeModeControllerProvider);
    final accent = ref.watch(accentColorControllerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: CustomTheme.light(accent.color),
      darkTheme: CustomTheme.dark(accent.color),
      themeMode: themeMode,
      builder: (context, child) {
        return FlowAmbientBackground(
          child: ScaffoldMessenger(
            key: controller.scaffoldMessage,
            child: child ?? const SizedBox(),
          ),
        );
      },
    );
  }
}

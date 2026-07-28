import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/features/radio/presentation/pages/radio_page.dart';
import 'package:flow_music/features/settings/presentation/controllers/accent_color_controller.dart';
import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeControllerProvider);
    final accent = ref.watch(accentColorControllerProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: CustomTheme.light(accent.color),
      darkTheme: CustomTheme.dark(accent.color),
      themeMode: themeMode,
      home: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(child: RadioPage()),
      ),
    );
  }
}

import 'package:flow_music/core/routes/routes.dart';
import 'package:flow_music/core/utils/adaptive_layout.dart';
import 'package:flow_music/features/settings/presentation/controllers/settings_page_controller.dart';
import 'package:flow_music/features/settings/presentation/widgets/settings_desktop_content.dart';
import 'package:flow_music/features/settings/presentation/widgets/settings_mobile_content.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Pantalla de ajustes globales del usuario (idioma, tema, etc).
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key, this.embedded = false});

  final bool embedded;

  static const SettingsPageController _pageController =
      SettingsPageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.read(routeProvider);

    if (supportsFlowDesktopShell && useFlowWideLayout(context)) {
      return SettingsDesktopContent(
        embedded: embedded,
        onBack: () => route.go('/home'),
        pageController: _pageController,
      );
    }

    return SettingsMobileContent(
      onBack: () => route.push('/home'),
      pageController: _pageController,
    );
  }
}

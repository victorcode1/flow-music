import 'package:flow_music/core/routes/routes.dart';
import 'package:flow_music/core/utils/adaptive_layout.dart';
import 'package:flow_music/features/home/presentation/controllers/home_view_controller.dart';
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
    void goHome() {
      ref.read(homeViewProvider.notifier).setQuery('');
      route.go('/home');
    }

    if (supportsFlowDesktopShell && useFlowWideLayout(context)) {
      return SettingsDesktopContent(
        embedded: embedded,
        onBack: goHome,
        pageController: _pageController,
      );
    }

    return SettingsMobileContent(
      // Configuracion es una seccion principal, no una pantalla que deba
      // apilar otra copia de Home. `push` aqui creaba un historial alternado
      // Home/Configuracion al repetir el flujo desde el reproductor.
      onBack: goHome,
      pageController: _pageController,
    );
  }
}

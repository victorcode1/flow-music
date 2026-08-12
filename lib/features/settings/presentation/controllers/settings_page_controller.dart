import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/settings/data/settings_local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Helpers y acciones de presentacion para la pantalla de ajustes.
class SettingsPageController {
  const SettingsPageController();

  String languageName(String languageCode) {
    return switch (languageCode) {
      'es' => LocaleKeys.spanish.tr(),
      _ => LocaleKeys.english.tr(),
    };
  }

  String themeModeLabel(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => LocaleKeys.theme_mode_light.tr(),
      ThemeMode.dark => LocaleKeys.theme_mode_dark.tr(),
      ThemeMode.system => LocaleKeys.theme_mode_system.tr(),
    };
  }

  IconData themeModeIcon(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => Icons.light_mode_rounded,
      ThemeMode.dark => Icons.dark_mode_rounded,
      ThemeMode.system => Icons.brightness_auto_rounded,
    };
  }

  Future<void> persistLocale(
    BuildContext context,
    WidgetRef ref,
    String languageCode,
  ) async {
    await context.setLocale(Locale(languageCode));
    final stored = const SettingsLocalDataSource().read();
    await const SettingsLocalDataSource().write(
      stored.copyWith(
        locale: languageCode,
        updatedAtMs: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }
}

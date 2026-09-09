import 'package:flow_music/features/account/presentation/providers/user_data_sync_providers.dart';
import 'package:flow_music/features/settings/data/settings_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_controller.g.dart';

/// Clave dentro de la caja `settings` para guardar el `ThemeMode` elegido.
const String _themeModeKey = 'theme_mode';
const String _settingsUpdatedAtKey = 'settings_updated_at_ms';

/// Controla el `ThemeMode` activo de la app.
///
/// Mantiene la preferencia en la caja `settings` de Hive y la expone como
/// estado de Riverpod para que `MaterialApp.router` pueda reaccionar.
@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeMode build() {
    ref.watch(userDataSyncRevisionProvider);
    final box = Hive.box(settingsBoxName);
    final stored = box.get(_themeModeKey);
    return _decode(stored);
  }

  /// Cambia el modo activo y persiste el valor.
  Future<void> setMode(ThemeMode mode) async {
    final box = Hive.box(settingsBoxName);
    await ref.read(userDataSyncCoordinatorProvider).editPreferences(() async {
      await box.put(_themeModeKey, _encode(mode));
      await box.put(
        _settingsUpdatedAtKey,
        DateTime.now().millisecondsSinceEpoch,
      );
    });
    state = mode;
  }

  ThemeMode _decode(Object? raw) {
    return switch (raw) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  String _encode(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
  }
}

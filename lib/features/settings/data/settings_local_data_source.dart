import 'package:flow_music/features/settings/data/user_settings.dart';
import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

const _themeModeKey = 'theme_mode';
const _autoplayKey = 'autoplay_enabled';
const _localeKey = 'locale';
const _updatedAtKey = 'settings_updated_at_ms';

/// Lee y escribe los ajustes simples sobre la caja local de Hive.
class SettingsLocalDataSource {
  const SettingsLocalDataSource();

  Box get _box => Hive.box(settingsBoxName);

  UserSettings read() {
    final themeMode = _box.get(_themeModeKey);
    final autoplay = _box.get(_autoplayKey);
    final locale = _box.get(_localeKey);
    final updatedAt = _box.get(_updatedAtKey);
    return UserSettings(
      themeMode: themeMode is String ? themeMode : null,
      locale: locale is String ? locale : null,
      autoplayEnabled: autoplay is bool ? autoplay : null,
      updatedAtMs: updatedAt is int ? updatedAt : null,
    );
  }

  Future<void> write(UserSettings settings) async {
    final box = _box;
    Future<void> putIfNotNull(String key, Object? value) async {
      if (value == null) return;
      await box.put(key, value);
    }

    await putIfNotNull(_themeModeKey, settings.themeMode);
    await putIfNotNull(_localeKey, settings.locale);
    await putIfNotNull(_autoplayKey, settings.autoplayEnabled);
    await box.put(
      _updatedAtKey,
      settings.updatedAtMs ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<void> clear() async {
    await _box.delete(_themeModeKey);
    await _box.delete(_localeKey);
    await _box.delete(_autoplayKey);
    await _box.delete(_updatedAtKey);
  }
}

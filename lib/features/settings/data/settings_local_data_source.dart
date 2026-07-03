import 'package:flow_music/features/settings/data/user_settings.dart';
import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

const _themeModeKey = 'theme_mode';
const _autoplayKey = 'autoplay_enabled';
const _defaultPlaybackModeKey = 'default_playback_mode';
const _repeatKey = 'repeat_enabled';
const _smoothTransitionsKey = 'audio_tools_smooth_transitions';
const _localeKey = 'locale';
const _updatedAtKey = 'settings_updated_at_ms';
const _ownerUidKey = 'settings_owner_uid';

/// Lee y escribe los ajustes simples sincronizables sobre la misma caja
/// Hive `settings` que ya usan los controllers de theme/autoplay. Asi se
/// evita duplicar el almacenamiento local.
class SettingsLocalDataSource {
  const SettingsLocalDataSource();

  Box get _box => Hive.box(settingsBoxName);

  UserSettings read() {
    final themeMode = _box.get(_themeModeKey);
    final autoplay = _box.get(_autoplayKey);
    final defaultPlaybackMode = _box.get(_defaultPlaybackModeKey);
    final repeat = _box.get(_repeatKey);
    final smooth = _box.get(_smoothTransitionsKey);
    final locale = _box.get(_localeKey);
    final updatedAt = _box.get(_updatedAtKey);
    return UserSettings(
      themeMode: themeMode is String ? themeMode : null,
      locale: locale is String ? locale : null,
      autoplayEnabled: autoplay is bool ? autoplay : null,
      defaultPlaybackMode: defaultPlaybackMode is String
          ? defaultPlaybackMode
          : null,
      repeatEnabled: repeat is bool ? repeat : null,
      smoothTransitions: smooth is bool ? smooth : null,
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
    await putIfNotNull(_defaultPlaybackModeKey, settings.defaultPlaybackMode);
    await putIfNotNull(_repeatKey, settings.repeatEnabled);
    await putIfNotNull(_smoothTransitionsKey, settings.smoothTransitions);
    await box.put(
      _updatedAtKey,
      settings.updatedAtMs ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  String? ownerUid() {
    final value = _box.get(_ownerUidKey);
    return value is String && value.isNotEmpty ? value : null;
  }

  Future<void> markOwner(String uid) async {
    await _box.put(_ownerUidKey, uid);
  }

  Future<void> writeForUser(String uid, UserSettings settings) async {
    await write(settings);
    await markOwner(uid);
  }

  Future<void> clearForUser(String uid) async {
    await _box.delete(_themeModeKey);
    await _box.delete(_localeKey);
    await _box.delete(_autoplayKey);
    await _box.delete(_defaultPlaybackModeKey);
    await _box.delete(_repeatKey);
    await _box.delete(_smoothTransitionsKey);
    await _box.delete(_updatedAtKey);
    await markOwner(uid);
  }
}

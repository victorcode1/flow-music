import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeat_mode_controller.g.dart';

const String _repeatModeKey = 'repeat_enabled';
const String _legacyRepeatModeKey = 'repeat_current_track';
const String _settingsUpdatedAtKey = 'settings_updated_at_ms';

/// When true, the current track loops instead of advancing through the
/// autoplay queue. Persisted in Hive so the user's choice survives restarts.
@Riverpod(keepAlive: true)
class RepeatModeController extends _$RepeatModeController {
  @override
  bool build() {
    final box = Hive.box(settingsBoxName);
    final stored = box.get(_repeatModeKey);
    if (stored is bool) return stored;
    final legacy = box.get(_legacyRepeatModeKey);
    if (legacy is bool) return legacy;
    return false;
  }

  Future<void> setEnabled(bool enabled) async {
    final box = Hive.box(settingsBoxName);
    await box.put(_repeatModeKey, enabled);
    await box.put(_settingsUpdatedAtKey, DateTime.now().millisecondsSinceEpoch);
    state = enabled;
  }

  Future<void> toggle() => setEnabled(!state);
}

import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'autoplay_enabled_controller.g.dart';

const String _autoplayEnabledKey = 'autoplay_enabled';
const String _settingsUpdatedAtKey = 'settings_updated_at_ms';

/// Boolean preference: when true, after a tapped search result finishes the
/// app auto-advances through the remaining results (prefetched in parallel).
@Riverpod(keepAlive: true)
class AutoplayEnabledController extends _$AutoplayEnabledController {
  @override
  bool build() {
    final box = Hive.box(settingsBoxName);
    final stored = box.get(_autoplayEnabledKey);
    if (stored is bool) return stored;
    return true;
  }

  Future<void> setEnabled(bool enabled) async {
    final box = Hive.box(settingsBoxName);
    await box.put(_autoplayEnabledKey, enabled);
    await box.put(_settingsUpdatedAtKey, DateTime.now().millisecondsSinceEpoch);
    state = enabled;
  }
}

import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart'
    show settingsBoxName;
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Acentos de marca seleccionables en Configuracion (diseno StreamBeat). El
/// primero (esmeralda) es el color por defecto de la app.
enum FlowAccent {
  emerald(Color(0xFF18E0C2)),
  teal(Color(0xFF0D9488)),
  cyan(Color(0xFF0891B2)),
  sky(Color(0xFF0284C7)),
  blue(Color(0xFF3AA0FF)),
  indigo(Color(0xFF4F46E5)),
  violet(Color(0xFFA78BFF)),
  fuchsia(Color(0xFFD946EF)),
  coral(Color(0xFFFF4D6D)),
  red(Color(0xFFDC2626)),
  orange(Color(0xFFEA580C)),
  amber(Color(0xFFFFB13D)),
  lime(Color(0xFF65A30D));

  const FlowAccent(this.color);

  /// Color semilla que alimenta todo el `ColorScheme` y los gradientes.
  final Color color;
}

/// Clave dentro de la caja `settings` de Hive para el acento elegido.
const String _accentKey = 'accent_color';

/// Controla el color de acento activo de la app y lo persiste localmente en la
/// misma caja Hive que el resto de preferencias. `MaterialApp` reconstruye su
/// tema cuando cambia.
final accentColorControllerProvider =
    NotifierProvider<AccentColorController, FlowAccent>(
      AccentColorController.new,
    );

class AccentColorController extends Notifier<FlowAccent> {
  @override
  FlowAccent build() {
    return _decode(Hive.box(settingsBoxName).get(_accentKey));
  }

  /// Cambia el acento activo y lo persiste.
  Future<void> setAccent(FlowAccent accent) async {
    if (state == accent) return;
    await Hive.box(settingsBoxName).put(_accentKey, accent.name);
    state = accent;
  }

  FlowAccent _decode(Object? raw) {
    return FlowAccent.values.firstWhere(
      (accent) => accent.name == raw,
      orElse: () => FlowAccent.emerald,
    );
  }
}

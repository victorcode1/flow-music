import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Visibilidad del riel derecho ("A continuación" / "Letra") del reproductor
/// de escritorio.
///
/// El diseno pone un boton de cola en la barra superior para plegarlo: en
/// ventanas angostas el riel de 316px se come el reproductor, y quien solo
/// quiere escuchar prefiere la carátula a pantalla completa. Empieza abierto,
/// como en el mockup. Solo lo consume el shell de escritorio.
final desktopQueueRailVisibleProvider =
    NotifierProvider<DesktopQueueRailController, bool>(
      DesktopQueueRailController.new,
    );

class DesktopQueueRailController extends Notifier<bool> {
  @override
  bool build() => true;

  void toggle() => state = !state;
}

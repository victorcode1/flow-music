import 'package:flutter/material.dart';

/// Cubiertas de degradado para listas y colecciones sin caratula propia.
///
/// Las playlists locales guardan nombre y canciones, no imagen. El mockup
/// "StreamBeat — Rediseño" resuelve ese hueco con cubiertas de color solido en
/// degradado, asi que aqui se reproduce esa paleta y se elige una de forma
/// determinista a partir del id de la lista: la misma lista conserva su color
/// entre sesiones y entre pantallas (sidebar y biblioteca muestran el mismo).
abstract final class FlowCoverGradients {
  /// Cubiertas del mockup, una por familia de color.
  ///
  /// Son las seis del mockup y no mas: sus otros degradados son caratulas de
  /// album de relleno (azules y marrones apagados) que, mezcladas aqui, dejaban
  /// dos tercios de la cuadricula en la misma franja azul. Con seis hues bien
  /// separados una pantalla de emisoras se lee variada.
  static const List<List<Color>> _palette = [
    [Color(0xFF18E0C2), Color(0xFF0B6EE0)], // turquesa -> azul (marca)
    [Color(0xFFFF5773), Color(0xFF7A1830)], // rosa -> granate
    [Color(0xFF7C3AED), Color(0xFF3A1A6C)], // violeta -> morado
    [Color(0xFFFFB13D), Color(0xFFFF5773)], // ambar -> rosa
    [Color(0xFF0EA5E9), Color(0xFF1E3A8A)], // celeste -> azul marino
    [Color(0xFF16A34A), Color(0xFF064E3B)], // verde -> esmeralda
  ];

  /// Degradado estable para [seed] (normalmente el id de la playlist).
  static LinearGradient of(String seed) {
    return LinearGradient(
      colors: _palette[_indexOf(seed)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  /// Color dominante de la cubierta de [seed], para bordes y realces.
  static Color accentOf(String seed) => _palette[_indexOf(seed)].first;

  static int _indexOf(String seed) {
    if (seed.isEmpty) return 0;
    // Hash FNV-1a de 32 bits: barato, estable entre plataformas y ejecuciones
    // (a diferencia de String.hashCode, que Dart no garantiza estable).
    var hash = 0x811c9dc5;
    for (final unit in seed.codeUnits) {
      hash = (hash ^ unit) * 0x01000193 & 0xFFFFFFFF;
    }
    // Avalancha final (finalizador de MurmurHash3). `% _palette.length` solo
    // mira los bits bajos, que es justo donde FNV mezcla peor; con ids muy
    // parecidos entre si (uuid con la misma cola, ids correlativos por tiempo)
    // eso puede agrupar cubiertas. Este paso los dispersa.
    hash ^= hash >>> 16;
    hash = (hash * 0x85EBCA6B) & 0xFFFFFFFF;
    hash ^= hash >>> 13;
    hash = (hash * 0xC2B2AE35) & 0xFFFFFFFF;
    hash ^= hash >>> 16;
    return hash % _palette.length;
  }
}

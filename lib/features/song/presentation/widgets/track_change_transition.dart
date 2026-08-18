import 'package:flutter/material.dart';

/// Transicion visual entre canciones: la pista que sale se apaga deslizandose
/// hacia un lado mientras la nueva entra desde el otro, como el carrusel de un
/// reproductor. Sustituye el "brinco" de cambiar caratula y titulo de golpe.
///
/// [trackKey] identifica la cancion (normalmente el videoId): mientras no
/// cambie, el hijo se actualiza sin animacion. [forward] decide el sentido, asi
/// "siguiente" y "anterior" se sienten opuestos.
class TrackChangeTransition extends StatelessWidget {
  const TrackChangeTransition({
    super.key,
    required this.trackKey,
    required this.child,
    this.forward = true,
    this.expandToParent = false,
    this.alignment = Alignment.center,
    this.slide = 0.16,
    this.scaleFrom = 0.94,
    this.duration = const Duration(milliseconds: 420),
  });

  final String trackKey;
  final Widget child;

  /// `true` cuando se avanza en la cola; `false` al volver a la anterior.
  final bool forward;

  /// Las caratulas deben ocupar todo el hueco que les da el padre. El texto, en
  /// cambio, se mide por su contenido.
  final bool expandToParent;

  final AlignmentGeometry alignment;

  /// Desplazamiento del deslizamiento, como fraccion del ancho del hijo.
  final double slide;

  final double scaleFrom;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final dx = forward ? slide : -slide;

    return AnimatedSwitcher(
      duration: duration,
      reverseDuration: duration,
      layoutBuilder: (currentChild, previousChildren) => Stack(
        alignment: alignment,
        fit: expandToParent ? StackFit.expand : StackFit.loose,
        children: [...previousChildren, ?currentChild],
      ),
      transitionBuilder: (child, animation) => DualTransitionBuilder(
        animation: animation,
        forwardBuilder: (context, entering, child) =>
            _slideFade(entering, from: Offset(dx, 0), child: child!),
        reverseBuilder: (context, leaving, child) => _slideFade(
          leaving,
          from: Offset(-dx, 0),
          reverse: true,
          child: child!,
        ),
        child: child,
      ),
      child: KeyedSubtree(key: ValueKey<String>(trackKey), child: child),
    );
  }

  /// Un solo cuerpo para las dos mitades: al entrar la animacion corre 0 -> 1
  /// desde [from]; al salir tambien corre 0 -> 1, pero hacia [from] y bajando
  /// la opacidad ([reverse]).
  Widget _slideFade(
    Animation<double> animation, {
    required Offset from,
    required Widget child,
    bool reverse = false,
  }) {
    final curved = CurvedAnimation(
      parent: animation,
      curve: reverse ? Curves.easeInCubic : Curves.easeOutCubic,
    );
    final offsets = reverse
        ? Tween<Offset>(begin: Offset.zero, end: from)
        : Tween<Offset>(begin: from, end: Offset.zero);
    final scales = reverse
        ? Tween<double>(begin: 1, end: scaleFrom)
        : Tween<double>(begin: scaleFrom, end: 1);
    final opacities = reverse
        ? Tween<double>(begin: 1, end: 0)
        : Tween<double>(begin: 0, end: 1);

    return FadeTransition(
      opacity: opacities.animate(curved),
      child: SlideTransition(
        position: offsets.animate(curved),
        child: ScaleTransition(scale: scales.animate(curved), child: child),
      ),
    );
  }
}

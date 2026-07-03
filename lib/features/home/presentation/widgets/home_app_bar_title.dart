import 'package:flutter/material.dart';

/// Título textual del app bar de home.
///
/// Renderiza el texto del encabezado con dos tratamientos tipográficos según
/// si hay una pista sonando:
///
/// * **Sin reproducción** (`hasNowPlaying == false`): muestra el wordmark de
///   marca ("StreamBeat") con `titleLarge` y peso fuerte. El título grande de
///   sección ("Descubre") vive en el cuerpo, por lo que aquí la marca actúa
///   como rótulo principal.
/// * **Con reproducción** (`hasNowPlaying == true`): el texto pasa al título de
///   la pista y se reduce a `titleMedium`. Así el wordmark cede protagonismo y
///   no compiten dos encabezados del mismo tamaño en pantalla.
///
/// El texto siempre se limita a una línea con elipsis para no romper el layout
/// del app bar cuando los títulos son largos.
class HomeAppBarTitle extends StatelessWidget {
  /// Texto a mostrar: el wordmark de marca o el título de la pista actual.
  final String titleText;

  /// Indica si hay una pista en reproducción; cambia el tratamiento tipográfico.
  final bool hasNowPlaying;

  const HomeAppBarTitle({
    super.key,
    required this.titleText,
    required this.hasNowPlaying,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      titleText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      // En home "StreamBeat" actua como wordmark de marca (pequeno); el
      // titulo grande de seccion ("Descubre") vive en el cuerpo, asi no
      // compiten dos encabezados del mismo tamano.
      style: hasNowPlaying
          ? theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
            )
          : theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
    );
  }
}

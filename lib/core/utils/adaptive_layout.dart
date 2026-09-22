import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Ancho minimo que necesita el shell de escritorio para respirar (sidebar de
/// 232px + contenido). Los runners de escritorio lo usan como tamano minimo de
/// ventana; ya no decide que diseno se dibuja.
const double flowWideLayoutBreakpoint = 900;
const double flowContentMaxWidth = 1320;

/// `true` cuando la app corre sobre un sistema de escritorio (macOS, Windows o
/// Linux), incluido el navegador de un equipo de escritorio.
///
/// La variante de escritorio se decide **por plataforma, no por ancho de
/// ventana**: encoger la ventana en macOS no convierte la app en un movil, y
/// el salto de shell a mitad de sesion hacia que el rediseno se perdiera al
/// redimensionar (sidebar y barra superior desaparecian y volvian las tarjetas
/// moviles). Lo que se adapta al ancho es el contenido — rejillas y columnas
/// cuentan celdas con `LayoutBuilder` — no el shell.
///
/// En web `defaultTargetPlatform` refleja el sistema del navegador, asi que
/// esta misma condicion deja el shell de escritorio en un navegador de
/// escritorio y el movil en un telefono.
bool get supportsFlowDesktopShell => switch (defaultTargetPlatform) {
  TargetPlatform.macOS ||
  TargetPlatform.windows ||
  TargetPlatform.linux => true,
  TargetPlatform.android ||
  TargetPlatform.iOS ||
  TargetPlatform.fuchsia => false,
};

/// `true` cuando la pantalla se dibuja dentro del shell de escritorio.
///
/// Toma el `context` por consistencia con el resto de helpers de este archivo
/// (y para poder volver a depender de el sin tocar cada llamada).
bool useFlowDesktopShell(BuildContext context) => supportsFlowDesktopShell;

/// Margen lateral del area de contenido: 40px en escritorio (mockup
/// "StreamBeat — Rediseño"), 16px en movil.
double flowContentInset(BuildContext context) =>
    useFlowDesktopShell(context) ? 40 : 16;

/// Hueco reservado al pie de las listas.
///
/// En movil el mini player flota por encima del contenido y hay que dejarle
/// sitio o tapa el ultimo item. En escritorio la barra de reproduccion es una
/// fila mas del shell y no invade la lista, asi que reservar 100px solo deja un
/// vacio al final.
double flowListBottomInset(BuildContext context) =>
    useFlowDesktopShell(context) ? 32 : 100;

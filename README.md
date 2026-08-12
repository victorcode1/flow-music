# StreamBeat

Aplicación Flutter para descubrir música, reproducir audio y explorar estaciones de radio internacionales.

## Datos y privacidad

La aplicación funciona de forma local:

- Favoritos, playlists y preferencias se guardan solamente en el dispositivo con Hive.
- La ubicación se solicita solo mientras la app está abierta, para elegir el país de las recomendaciones y centrar el explorador de radio. No se guarda ni se envía a un servidor.
- La aplicación envía a Sentry errores y una muestra de trazas de rendimiento para diagnóstico. La integración no envía información personal por defecto.

La rama main conserva las funciones de búsqueda y reproducción basadas en YouTube. La rama store se prepara como una experiencia centrada únicamente en estaciones de radio.

## Requisitos

- Flutter SDK 3.8 o posterior
- Xcode y CocoaPods para iOS o macOS
- Android SDK para Android

## Ejecutar

    flutter pub get
    flutter run

Sentry ya está conectado al proyecto `flutter`. Para cambiar temporalmente el
proyecto o el entorno de destino:

    flutter run \
      --dart-define=SENTRY_DSN=https://TU_DSN \
      --dart-define=SENTRY_ENVIRONMENT=development \
      --dart-define=SENTRY_TRACES_SAMPLE_RATE=1.0

`SENTRY_TRACES_SAMPLE_RATE` acepta valores entre `0.0` y `1.0`. Si se omite,
usa `1.0` en debug/profile y `0.1` en release. Para desactivar el envío en una
compilación, pasa `--dart-define=SENTRY_DSN=`. Para ver logs internos del SDK
durante una prueba, agrega `--dart-define=SENTRY_DEBUG=true`.

Para generar los archivos de Riverpod y Freezed:

    dart run build_runner build --delete-conflicting-outputs

## Compilación

    flutter build appbundle --release

    flutter build ipa --release

## Funcionalidades en main

- Búsqueda y reproducción de música
- Recomendaciones por país
- Radios internacionales y explorador de radio
- Reproducción en segundo plano
- Favoritos, playlists y ajustes locales

## Aviso sobre contenido de terceros

Las marcas, catálogos y emisiones pertenecen a sus respectivos titulares. Antes de publicar una versión en una tienda, confirma que cada fuente de audio y su forma de reproducción cumplen los términos de servicio y las licencias aplicables.

# StreamBeat

Aplicación Flutter para descubrir música, reproducir audio y explorar estaciones de radio internacionales.

## Datos y privacidad

La reproducción y las preferencias siguen funcionando de forma local. Las
funciones opcionales de cuenta y monetización usan servicios desacoplados:

- Favoritos, playlists y preferencias se guardan localmente con Hive. Una suscripción mensual pagada y vigente permite guardar una copia en Supabase y recuperarla al entrar con la misma cuenta en otro dispositivo. La compra de por vida solo quita anuncios.
- La ubicación se solicita solo mientras la app está abierta, para elegir el país de las recomendaciones y centrar el explorador de radio. No se guarda ni se envía a un servidor.
- La recomendación diaria es opcional y se programa localmente a las 6:00 p. m. con una emisora aleatoria; no requiere un servidor ni ubicación en segundo plano.
- Las compilaciones `release` envían a Sentry errores y una muestra de trazas de rendimiento para diagnóstico. Sentry permanece desactivado en debug y profile, y la integración no envía información personal por defecto.
- Supabase Auth y PostgreSQL conservan la cuenta y el perfil entre dispositivos. El acceso opcional con Google comparte con StreamBeat el correo, nombre, foto e identificador básico autorizados por el usuario.
- RevenueCat valida la suscripción mensual y la compra Premium de por vida mediante Google Play Billing o Apple In-App Purchase.
- La base de datos verifica el permiso mensual antes de leer o escribir copias. Al vencer se pausa la nube y se conservan los datos del dispositivo. Cerrar sesión separa los datos locales por cuenta.
- AdMob muestra como máximo un banner compacto, separado de los controles, también durante la reproducción con la app en primer plano. Se oculta para usuarios Premium y libera el anuncio al pasar a segundo plano.

La rama main conserva las funciones de búsqueda y reproducción basadas en YouTube. La rama store se prepara como una experiencia centrada únicamente en estaciones de radio.

## Requisitos

- Flutter SDK 3.38.1 o posterior
- Xcode y CocoaPods para iOS o macOS
- Android SDK para Android

## Ejecutar

    flutter pub get
    flutter run

Para habilitar cuenta, compras Premium y anuncios usa el archivo de ejemplo en
`config/monetization.example.json`:

    cp config/monetization.example.json config/monetization.local.json
    flutter run --dart-define-from-file=config/monetization.local.json

La arquitectura, el esquema y el procedimiento de publicación están descritos
en `docs/MONETIZATION.md`.

Sentry ya está conectado al proyecto `streambeat` y solo se inicializa en
compilaciones `release`. `flutter run` y las compilaciones profile no envían
errores, trazas ni eventos. Las compilaciones release usan el entorno
`production` por defecto. Para cambiar el proyecto o el entorno de una
compilación release:

    flutter build ipa --release \
      --dart-define=SENTRY_DSN=https://TU_DSN \
      --dart-define=SENTRY_ENVIRONMENT=production \
      --dart-define=SENTRY_TRACES_SAMPLE_RATE=1.0

`SENTRY_TRACES_SAMPLE_RATE` acepta valores entre `0.0` y `1.0`. Si se omite,
usa `0.1`. Para desactivar también el envío en una compilación release, pasa
`--dart-define=SENTRY_DSN=`. Para ver logs internos del SDK durante una prueba
release, agrega `--dart-define=SENTRY_DEBUG=true`.

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
- Recomendación local diaria mediante notificación, con acceso directo a la emisora
- Flow Mix por estado de ánimo, personalizado localmente con historial, favoritos y feedback
- Favoritos, playlists y ajustes locales

## Aviso sobre contenido de terceros

Las marcas, catálogos y emisiones pertenecen a sus respectivos titulares. Antes de publicar una versión en una tienda, confirma que cada fuente de audio y su forma de reproducción cumplen los términos de servicio y las licencias aplicables.

## Herramientas de desarrollo

La configuración de CodeGraph y su uso local están en `docs/codegraph.md`.
La herramienta de compilación Android usa Gradle 9.1.0, AGP 9.0.1 y Kotlin
2.3.20; la integración está validada con Flutter 3.47.3 y Dart 3.13.3.
Para verificar las claves públicas y los identificadores antes de una compilación:

    dart run tool/verify_monetization_config.dart config/monetization.local.json
    dart run tool/verify_monetization_config.dart config/monetization.local.json --platform=ios

La validación iOS requiere macOS y comprueba también `ios/Runner/Info.plist`.
Estas comprobaciones no sustituyen la validación de compras en las tiendas.

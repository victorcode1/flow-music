# StreamBeat Radio

Aplicación Flutter centrada exclusivamente en descubrir y escuchar estaciones de radio por Internet.

## Alcance de esta rama

- La pantalla inicial muestra estaciones de radio, con búsqueda por nombre, filtros de país y género.
- Permite reproducir transmisiones en vivo y mantener favoritos o playlists de radio en el dispositivo.
- No incluye búsqueda, descarga ni reproducción de contenido de YouTube.
- No incluye cuentas de usuario, sincronización en la nube ni rastreo de ubicación.

Las listas de favoritos y playlists se guardan localmente con Hive. La aplicación consulta Radio Browser únicamente para obtener el catálogo público de emisoras y sus URLs de transmisión.

## Ejecutar

    flutter pub get
    flutter run

## Compilación

    flutter build appbundle --release
    flutter build ipa --release

## Aviso de publicación

Antes de publicar, verifica que las emisoras y su reproducción cumplan las licencias, derechos y políticas aplicables de cada tienda.

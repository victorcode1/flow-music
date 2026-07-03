# flow_music - Arquitectura y reglas de desarrollo

Este archivo es la fuente de verdad para Codex, Claude, Copilot y cualquier
otra herramienta de IA que trabaje sobre este repositorio.

Si una regla de arquitectura, convencion, flujo de datos o comando cambia,
actualiza primero este archivo. Los archivos especificos por herramienta deben
ser adaptadores cortos que apunten aqui, no copias largas de estas reglas.

## Lectura rapida para agentes de IA

Si eres una herramienta de IA, esta es la prioridad de lectura y de decision:

1. Leer este archivo completo antes de proponer arquitectura nueva.
2. Mantener el cambio dentro de la feature o capa correcta.
3. Sacar la logica de la vista cuando un widget empiece a mezclar layout,
   estado derivado, listeners, side effects o comandos.
4. Corregir la causa raiz con el menor cambio coherente posible.
5. Validar con `dart format`, `flutter analyze` y tests relevantes cuando el
   entorno lo permita.

Si hay conflicto entre comodidad de implementacion y estructura del proyecto,
gana la estructura del proyecto.

## Contrato operativo para escribir codigo

Toda IA que escriba codigo en este repo debe comportarse asi:

### 1. Cambios pequenos y locales

- Preferir cambios pequenos, reversibles y faciles de revisar.
- No mezclar en el mismo cambio: bugfix + refactor amplio + cambios visuales.
- Si el pedido es puntual, no expandir el alcance sin necesidad tecnica real.
- Reutilizar archivos, providers, controllers y widgets existentes antes de
  crear capas nuevas.

### 2. Divide y venceras

- Si un widget crece, dividirlo por responsabilidad.
- La pagina debe quedar como composicion y no como contenedor de toda la
  logica ni de todo el markup.
- Extraer piezas por niveles:
  - `presentation/pages/` para la pagina o shell
  - `presentation/widgets/` para bloques visuales y subcomponentes
  - `presentation/controllers/` para coordinacion, comandos y side effects
- Cuando un archivo se vuelve dificil de leer, priorizar una composicion del
  estilo `Page -> Shell -> Card -> Section -> Field/Button`.

### 3. Pure View + controller

- La UI debe renderizar y delegar.
- Los widgets no deben contener reglas de negocio, acceso a repositorios,
  storage, HTTP, reproductores ni sincronizacion compleja.
- Si un `StatefulWidget` necesita mas que estado visual efimero, mover la
  logica a un controller, notifier o provider del feature.
- Callbacks cortos: recibir evento, delegar al controller, reconstruir UI.

### 4. Coherencia de arquitectura

- Mantener Clean Architecture + MVVM + Pure View como direccion obligatoria.
- Domain no depende de Flutter ni de infraestructura externa.
- Data encapsula APIs, plugins, Hive, filesystem, Firebase y HTTP.
- Presentation coordina estado de vista y compone UI.
- No crear helpers globales rapidos para saltarse capas.

### 5. Riverpod como regla de proyecto

- Para estado nuevo, preferir Riverpod con anotaciones y codigo generado.
- No introducir providers legacy nuevos salvo migracion puntual justificada.
- Si una pieza de estado es del feature, vive dentro de su feature.
- Si un widget depende de estado complejo, observar solo lo necesario.

### 6. Legibilidad antes que cleverness

- Nombres claros y especificos del dominio.
- Evitar `build()` largos con demasiadas ramas o decisiones mezcladas.
- Evitar funciones gigantes con demasiadas responsabilidades.
- Agregar comentarios solo cuando aclaren una decision no obvia.
- Cada widget o controller nuevo con responsabilidad real debe vivir en su
  propio archivo.

### 7. Validacion obligatoria

- Despues de editar, correr la validacion mas acotada posible del slice tocado.
- Orden recomendado:
  1. `dart format` del archivo o modulo tocado
  2. `flutter analyze` del archivo o modulo tocado
  3. `flutter test` del modulo si hay pruebas relevantes
- No dar por terminado un cambio sin al menos una validacion ejecutable cuando
  el entorno lo permita.

### 8. Lo que una IA no debe hacer

- No editar archivos generados a mano.
- No meter strings visibles hardcodeados.
- No meter colores literales fuera del sistema de tema permitido.
- No meter secretos, tokens ni credenciales.
- No introducir paquetes nuevos sin necesidad clara.
- No hacer git revert, reset, commit o push sin pedido explicito.
- No resolver deuda de lectura creando un archivo enorme nuevo que concentre
  otra vez demasiadas responsabilidades.

## Proposito del proyecto

`flow_music` es una app Flutter para busqueda, seleccion y reproduccion de
musica usando fuentes de YouTube, con soporte de audio, video, i18n,
persistencia local y navegacion por modulos.

## Stack actual

- Flutter / Dart SDK `>=3.8.0 <4.0.0`
- Riverpod 3 con `riverpod_annotation` y generadores
- Flutter Hooks / Hooks Riverpod
- Freezed 3 + Json Serializable
- Go Router
- easy_localization
- Hive para persistencia local
- audioplayers y video_player
- http y youtube_explode_dart
- Firebase: `firebase_core`, `firebase_auth`, `cloud_firestore`,
  `google_sign_in` (autenticacion y sincronizacion en la nube)

## Reglas no negociables

- Mantener Clean Architecture + MVVM + Pure View como direccion del proyecto.
- Aplicar SOLID, bajo acoplamiento, alta cohesion y nombres claros.
- Separar UI, estado, reglas de negocio, integraciones y persistencia.
- No crear dependencias globales ocultas ni accesos directos desde widgets a
  APIs, storage, reproductores o servicios externos.
- No hardcodear textos visibles nuevos; usar `LocaleKeys.x.tr()`.
- No hardcodear secrets, API keys, tokens ni credenciales. Usar
  `--dart-define-from-file=.env`.
- No editar manualmente archivos generados (`*.g.dart`, `*.freezed.dart`,
  `*.riverpod.dart`, rutas generadas, etc.).
- No hacer commits, pushes, cambios destructivos de git ni reverts desde IA sin
  pedido explicito del desarrollador.
- Toda funcion nueva con logica real debe tener tests cuando sea viable.
- Todo cambio debe respetar el stack y versiones configuradas en `pubspec.yaml`.

## Checklist de ejecucion para IA

Antes de editar:

1. Leer este archivo.
2. Revisar `pubspec.yaml` y el modulo afectado.
3. Confirmar si el cambio pertenece a `app`, `core`, `shared` o a una feature.
4. Identificar si el problema es de vista, controller, provider, dominio o data.
5. Elegir la menor modificacion coherente con la arquitectura.

Mientras editas:

1. Mantener el cambio por capas.
2. Si una vista se vuelve dificil de leer, extraer widgets pequenos y dejar la
   coordinacion en un controller o notifier.
3. Si hay side effects, listeners, timers, reproduccion o sync, moverlos fuera
   del widget.
4. Mantener imports y archivos cerca del feature tocado.

Despues de editar:

1. Formatear el slice tocado.
2. Analizar el slice tocado.
3. Correr tests relevantes si existen.
4. Si cambian reglas del proyecto, actualizar este archivo.

## Estructura arquitectonica

El codigo de aplicacion vive organizado por feature. `core` conserva
infraestructura transversal, `shared` contiene piezas reutilizables reales y
cada feature agrupa sus propias capas de datos, dominio y presentacion segun
corresponda:

```text
lib/
  app/                    # App root y composicion global
  core/                   # Infra compartida: rutas, tema, audio, utils
  features/
    home/
      domain/             # Contratos propios del home
      presentation/       # Page, widgets, providers y controller del home
    search/
      data/               # Modelo/repositorio de sugerencias de YouTube
      presentation/       # Pantallas, widgets y providers de busqueda
    song/
      presentation/       # Pantalla, controller y widgets del reproductor
    settings/
      presentation/       # Pantalla de configuracion
    feature_name/
      domain/             # Entidades, contratos y casos de uso
      data/               # Datasources, DTOs, mappers, repositorios concretos
      presentation/       # Pages, widgets, providers, controllers y estados UI
  shared/                 # Componentes o helpers reutilizables entre features
```

No crear carpetas de primer nivel nuevas dentro de `lib/` para pantallas,
providers o widgets de feature. Si aparece una feature nueva, crearla bajo
`lib/features/<feature_name>/`. Si un modulo existente se toca por una feature
o bugfix, mejorar su estructura localmente sin romper imports ni comportamiento.

## Capas

### Domain

La capa de dominio es la mas interna y no depende de Flutter, UI, storage,
HTTP, YouTube, Hive ni plugins.

- Entidades puras del negocio.
- Interfaces de repositorios.
- Use cases con una sola responsabilidad.
- Reglas de validacion y transformacion testeables.

### Data

La capa de datos implementa contratos de dominio y habla con fuentes externas.

- DTOs y modelos de serializacion con Freezed cuando aplique.
- Datasources para HTTP, YouTube, Hive, filesystem o plugins.
- Repositorios concretos que mapean errores externos a errores del dominio.
- Mappers explicitos entre DTOs y entidades.

### Presentation

La capa de presentacion contiene UI y estado de vista.

- Pages y widgets solo componen layout y delegan acciones.
- Providers, Notifiers, controllers o view models coordinan estado.
- Estados de UI con Freezed o `sealed class` cuando haya variantes.
- Los callbacks de widgets deben ser delgados: validar lo minimo y delegar.

#### Regla obligatoria para widgets interactivos

Cuando un widget necesita algo mas que estado visual efimero, la logica debe
salir del archivo del widget y vivir en `presentation/controllers/` o en un
provider/notifier del feature.

- Un widget no debe contener `Timer`, `StreamSubscription`, polling,
  sincronizacion de reproductores, acceso directo a `AudioPlayer`,
  `VideoPlayerController`, storage, HTTP ni reglas derivadas de negocio.
- Esa logica debe ir en un controller/view model con estado propio, idealmente
  inmutable y testeable.
- El widget debe limitarse a:
  - crear/injectar el controller si aplica
  - escuchar su estado
  - renderizar la vista
  - reenviar callbacks al controller
- `StatefulWidget` solo se justifica para lifecycle de vista, animaciones o
  para poseer un controller de presentacion. No para mezclar listeners,
  comandos y layout en el mismo archivo.
- Si un componente crece, dividir en:
  - `widgets/` para piezas visuales
  - `controllers/` para coordinacion y side effects
  - `state/` o archivo de estado inmutable cuando el estado ya no sea trivial
- Regla practica: si en un widget aparece mas de una responsabilidad entre
  layout, listeners, efectos, comandos o estado derivado, hay que extraer.

## Riverpod

- Todo provider nuevo debe usar anotaciones:
  - `@riverpod`
  - `@Riverpod(keepAlive: true)` solo si el estado debe sobrevivir desmontes.
- No crear providers manuales nuevos (`Provider`, `StateProvider`,
  `FutureProvider`, `StreamProvider`, `ChangeNotifierProvider`) salvo migracion
  puntual justificada.
- Para Notifiers usar el patron generado:

```dart
@riverpod
class ExampleController extends _$ExampleController {
  @override
  ExampleState build() {
    return const ExampleState.initial();
  }
}
```

- Declarar `part '<archivo>.g.dart';` en archivos con providers generados.
- Usar `.select()` para escuchar solo el fragmento necesario y evitar rebuilds.
- Las dependencias de un feature viven dentro del feature cuando no son globales.
- No introducir nuevos `legacy` providers. Si se toca codigo legacy, evaluar una
  migracion incremental a `Notifier` o `AsyncNotifier`.

## Freezed, modelos e inmutabilidad

- Estados, DTOs, entidades con serializacion y modelos complejos deben ser
  inmutables.
- Preferir Freezed para `copyWith`, igualdad, union states y JSON.
- Con Dart moderno, usar `abstract class` o `sealed class` segun corresponda.
- No meter reglas de negocio pesadas dentro de DTOs de API.
- Los modelos de API deben tener mappers hacia entidades o estados internos.

## UI, widgets y tema

- Un widget con responsabilidad propia debe vivir en su propio archivo.
- Cada widget nuevo relevante debe tener DocComment breve en espanol latino
  explicando que representa y cual es su responsabilidad.
- Widgets pequenos, componibles y con nombres de dominio.
- Evitar `build()` largos con decisiones complejas; extraer componentes,
  providers, helpers o controllers testeables.
- No poner logica de negocio, networking, storage, reproduccion o parsing dentro
  de widgets.
- Usar `const` siempre que sea posible.
- Respetar `CustomTheme`, extensiones de tema y convenciones visuales existentes.
- Los componentes compartidos deben vivir en una capa compartida solo si son
  realmente reutilizables por mas de un modulo.

### Color y modo oscuro

`CustomTheme` expone `CustomTheme.light` y `CustomTheme.dark`. La app aplica
ambos via `MaterialApp.router(theme:, darkTheme:, themeMode: ThemeMode.system)`.
Por lo tanto, todo widget debe leer color del tema activo, no de constantes.

Reglas obligatorias:

- Prohibido `Colors.black*`, `Colors.white*` o `Color(0xFF...)` literales dentro
  de widgets para texto, iconos, fondos, sombras o bordes. Esos colores no se
  invierten en dark mode y rompen contraste.
- Excepcion 1: dentro de `lib/core/theme/custom_theme.dart`, donde se define la
  paleta cruda.
- Excepcion 2: `Colors.transparent`, que es semanticamente neutro.
- Excepcion 3: assets decorativos (gradientes ya definidos en `FlowThemeExtras`,
  ilustraciones).
- Usar siempre `Theme.of(context).colorScheme.*` y, para gradientes o vidrios,
  `theme.extension<FlowThemeExtras>()`.
- Para sombras usar `colorScheme.scrim` con alpha, nunca `Colors.black`.
- Texto sobre `colorScheme.primary`/`secondary` debe usar
  `colorScheme.onPrimary`/`onSecondary`, no `Colors.white` literal.
- Texto secundario debe usar `colorScheme.onSurfaceVariant`, no
  `Colors.black54`.
- Tokens habituales:
  - Fondo principal: `colorScheme.surface`
  - Fondos secundarios: `surfaceContainer`, `surfaceContainerHigh`,
    `surfaceContainerHighest`
  - Texto principal: `onSurface`
  - Texto secundario o hints: `onSurfaceVariant`
  - Bordes sutiles: `outline`, `outlineVariant`
  - Acentos: `primary`, `secondary`, `tertiary`

Antes de mergear, verificar visualmente la pantalla nueva en `light` y `dark`
con el simulador o cambiando el modo del sistema. Si un texto desaparece al
cambiar de modo, es bug bloqueante.

## Internacionalizacion

- Los textos visibles nuevos van en `assets/translations/en.json` y
  `assets/translations/es.json`.
- Usar las claves generadas en `lib/core/utils/locale_keys.g.dart`.
- Uso esperado:

```dart
LocaleKeys.someKey.tr()
```

- Despues de modificar traducciones, regenerar:

```bash
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart -O lib/core/utils
```

## Navegacion

- La navegacion vive en `lib/core/routes/routes.dart`.
- Usar Go Router como fuente unica de rutas.
- No navegar con strings duplicados dispersos si la ruta ya tiene nombre o
  helper.
- Mantener parametros de ruta/query tipados o mapeados de forma clara antes de
  entrar a la pantalla.

## Integraciones externas

### YouTube y HTTP

- El acceso a YouTube o HTTP debe estar encapsulado en repositorios/datasources.
- No llamar APIs externas directamente desde widgets.
- No filtrar detalles tecnicos de HTTP hacia UI sin mapearlos.
- Errores externos deben convertirse en errores entendibles para dominio o UI.
- Evitar logs con URLs firmadas, tokens, API keys o datos sensibles.

### API keys

Las llaves se leen con `String.fromEnvironment`. El `.env` debe definir:

```sh
YOUTUBE_API_KEY_IOS=...
YOUTUBE_API_KEY_ANDROID=...
YOUTUBE_API_KEY_WEB=...
```

Ejecutar localmente:

```bash
flutter run --dart-define-from-file=.env
```

### Audio y video

- Reproductores, streams y lifecycle deben estar en controllers/services, no en
  widgets.
- Todo `StreamSubscription`, `AudioPlayer`, `VideoPlayerController` o recurso
  nativo debe cerrarse en el ciclo de vida correcto.
- Mantener fallback claro entre audio y video.
- Las importaciones condicionales por plataforma deben quedar encapsuladas.

### Persistencia local

- Hive y cualquier storage local deben estar encapsulados detras de repositorios
  o datasources.
- No abrir cajas, leer storage o escribir cache desde UI.
- No guardar datos sensibles sin una estrategia explicita de seguridad.

### Autenticacion (Firebase Auth)

La autenticacion vive en `lib/features/auth/` siguiendo el corte estandar
domain / data / presentation:

- `domain/entities/auth_user.dart`: proyeccion plana del usuario expuesta al
  resto de la app (id, email, displayName, photoUrl).
- `domain/repositories/auth_repository.dart`: contrato abstracto. Tambien
  define `AuthException` para que la UI mapee codigos a mensajes
  internacionalizados.
- `data/repositories/firebase_auth_repository.dart`: implementacion contra
  Firebase Auth + Google Sign-In. Guarda un perfil minimo en
  `users/{uid}` en Firestore cuando alguien inicia sesion por primera vez.
- `data/providers/auth_providers.dart`: providers Riverpod (`@riverpod`)
  para el repositorio y para `GoogleSignIn`. Los client IDs estan hardcoded
  porque vienen del proyecto Firebase publico.
- `presentation/notifiers/auth_notifier.dart`: `StreamNotifier` que expone
  el usuario actual; las pantallas escuchan `authNotifierProvider`.
- `presentation/pages/login_page.dart`: UI combinada de login + registro,
  con Google como atajo.

Reglas obligatorias:

- Toda navegacion privada se gatea con el `redirect` de
  `lib/core/routes/routes.dart`, que apunta al stream del repositorio. La
  ruta `/login` es la unica publica.
- Las llamadas a Firebase Auth NO se hacen desde widgets; siempre via
  `AuthNotifier` o el repositorio.
- Los errores de Firebase se transforman a `AuthException` con mensaje en
  espanol latino antes de llegar a UI.
- Para sumar un proveedor (Apple, Microsoft, etc.) extender
  `AuthRepository` y agregar el flujo en `FirebaseAuthRepository`.

### Sincronizacion en la nube (Firestore)

La capa de sincronizacion vive en `lib/core/sync/` y trata Firestore como
una copia espejo del estado local. La fuente de verdad sigue siendo Hive,
asi que la app funciona offline; cuando hay sesion, los cambios se
empujan best-effort y al iniciar sesion se hace un pull con merge.

Componentes:

- `core/sync/syncable.dart`: contrato `Syncable` con `pushToRemote(uid)` y
  `pullFromRemote(uid)`. Cada feature implementa el suyo bajo `data/`.
- `core/sync/cloud_sync_controller.dart`: orquestador. Escucha
  `authNotifierProvider`; al detectar un uid nuevo, llama `pullAll`. Tambien
  expone `pushOne(Syncable)` para los controllers de feature.
- `core/sync/cloud_sync_watcher.dart`: widget bajo `MaterialApp` que aplica
  los ajustes que dependen de `BuildContext` (por ejemplo
  `context.setLocale`) cuando termina un pull.

Estructura Firestore actual:

```text
users/{uid}                                       <- perfil basico
users/{uid}/profile/settings                      <- tema, idioma, autoplay, repeat
users/{uid}/favorites/{videoId}                   <- 1 doc por favorito
users/{uid}/playlists/{playlistId}                <- 1 doc por playlist
```

Para agregar una preferencia / estado sincronizable nuevo:

1. Si es un ajuste simple (theme, locale, bool, etc.), agregarlo a
   `lib/features/settings/data/user_settings.dart` (`UserSettings`) y
   asegurarse de actualizar `SettingsLocalDataSource.read/write`. Ya queda
   cubierto por `SettingsSync` y no requiere registry nueva.
2. Si es una entidad propia (otra coleccion):
   1. Crear `lib/features/<feature>/data/<feature>_remote_data_source.dart`
      con `readAll`, `replaceAll`, `upsert`, `remove`.
   2. Crear `lib/features/<feature>/data/<feature>_sync.dart` que
      implementa `Syncable`. Definir la estrategia de merge en el `pull`.
   3. Crear `lib/features/<feature>/data/<feature>_providers.dart` con un
      `@Riverpod(keepAlive: true)` que devuelva el `Syncable`. No
      importar controllers desde aqui (evita ciclos).
   4. Agregar el provider a la lista en `cloudSyncRegistry` dentro de
      `lib/core/sync/cloud_sync_controller.dart`.
   5. En el controller de la feature, escuchar
      `cloudSyncControllerProvider`; cuando emita `CloudSyncDone`,
      re-leer el repositorio local para refrescar la UI. En cada mutacion
      local, llamar `pushOne(<feature>SyncProvider)`.
3. Reglas de Firestore: cualquier coleccion bajo `users/{uid}/...` debe
   estar restringida a `request.auth.uid == uid` en el `firestore.rules`
   del proyecto.

Reglas obligatorias:

- La capa de sincronizacion NO debe hablar con UI directamente.
- Los errores de pull/push se loguean con `debugPrint` pero no se
  propagan a la UI: si la red falla, el usuario sigue trabajando offline.
- El estado en memoria de un controller siempre se sincroniza con Hive,
  no se confia en orden de operaciones. Despues de aplicar un pull, el
  controller re-lee de Hive y emite su nuevo estado.

### Configuracion de Firebase

- `firebase_options.dart` se genera con FlutterFire CLI. No editar a mano.
- iOS / macOS usan el patron de frameworks precompilados de
  Invertase para acelerar `pod install`. El `ios/Podfile` declara:

  ```ruby
  pod 'FirebaseFirestore',
      :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git',
      :tag => '12.12.0'
  ```

  El tag debe seguir la version del plugin `cloud_firestore`. Si se
  actualiza el plugin, actualizar este tag en el mismo PR.

- Android: `google-services.json` en `android/app/`. La integracion la
  hace el plugin `firebase_core` via el plugin Gradle ya configurado.
- iOS: `GoogleService-Info.plist` en `ios/Runner/`. El URL scheme
  `com.googleusercontent.apps.<CLIENT_ID>` debe estar declarado en
  `Info.plist` para que el handshake de Google Sign-In funcione.

## Manejo de errores y estados async

- Preferir `AsyncValue` en providers asincronos.
- Para flujos de dominio o repositorios, usar resultados tipados, failures o
  sealed states en vez de lanzar excepciones crudas hacia la UI.
- La UI debe poder distinguir loading, empty, success y error.
- Los mensajes visibles de error deben estar internacionalizados.
- No ocultar errores con `catch` vacios.

## Generacion de codigo

Regenerar codigo cuando cambien providers anotados, modelos Freezed/JSON o rutas
generadas:

```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

No modificar a mano archivos generados. Si un generado queda inconsistente,
corregir el archivo fuente y regenerar.

## Tests y calidad

Comandos base:

```bash
dart format lib test
flutter analyze
flutter test
```

Reglas:

- `test/` debe espejar la estructura de `lib/` cuando exista.
- Toda logica nueva en mappers, parsers, repositories, controllers, notifiers,
  use cases o helpers debe tener prueba cuando sea viable.
- Todo bugfix debe incluir un test que falle antes del fix cuando sea razonable.
- Los widgets visuales triviales no requieren test unitario propio, pero las
  decisiones, ramas y transformaciones si.
- Si no hay suite de tests todavia para un modulo critico, crear tests enfocados
  al tocarlo.

## Archivos de instrucciones para herramientas

- No duplicar reglas largas en archivos especificos de herramientas.
- Crear adaptadores cortos como `AGENTS.md`, `CLAUDE.md` o
  `.github/copilot-instructions.md` que apunten a este documento.
- Si una herramienta necesita una regla adicional, esa regla debe ser
  compatible con este archivo y no contradecirlo.

## Mapa rapido actual

| Area                   | Ubicacion                                                   |
| ---------------------- | ----------------------------------------------------------- |
| App root               | `lib/main.dart`, `lib/app/app.dart`                         |
| Router                 | `lib/core/routes/routes.dart`                               |
| Tema                   | `lib/core/theme/custom_theme.dart`                          |
| Audio handler global   | `lib/core/audio/background_audio_handler.dart`              |
| Traducciones           | `assets/translations/`, `lib/core/utils/locale_keys.g.dart` |
| Firebase providers     | `lib/core/providers/firebase_providers.dart`                |
| Sincronizacion         | `lib/core/sync/`                                            |
| Autenticacion          | `lib/features/auth/`                                        |
| Home                   | `lib/features/home/`                                        |
| Cancion / player       | `lib/features/song/`                                        |
| Busqueda               | `lib/features/search/`                                      |
| Biblioteca / descargas | `lib/features/library/`                                     |
| Settings               | `lib/features/settings/`                                    |
| Widgets reutilizables  | `lib/shared/`                                               |

## Resumen

La direccion del proyecto es: UI pura por feature, estado con Riverpod generado,
modelos inmutables con Freezed, integraciones encapsuladas en data/repository,
textos internacionalizados, recursos correctamente liberados y tests para toda
logica real. El codigo debe poder crecer sin volverse dificil de leer, probar o
modificar.

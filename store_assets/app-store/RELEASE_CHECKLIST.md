# StreamBeat — estado de preparación para App Store

Estado verificado al 14 de septiembre de 2026: **cuenta de desarrollador y
registro de la app creados; monetización de App Store, RevenueCat y AdMob iOS
configurada; app todavía no enviada a revisión ni publicada**. La rama `store`
incluye Premium mensual y de por vida.

Una compilación o prueba local correcta no confirma la firma, la subida a
TestFlight, la aprobación de Apple ni la disponibilidad pública.

## Verificación remota actual

- La cuenta ya accede a App Store Connect y contiene el registro iOS de
  StreamBeat con Apple ID `6811965825` y Bundle ID
  `com.victorflores.streambeat`.
- La app está configurada como gratuita y disponible en los 175 países o
  regiones actuales, además de los territorios que Apple añada en el futuro.
- La ficha general quedó guardada con idioma principal es-MX, subtítulo
  `Radio mundial en vivo`, categoría principal Música y secundaria
  Entretenimiento.
- La versión de App Store Connect es `1.1.15`; la metadata es-MX está guardada.
- La suscripción mensual `remove_ads_monthly` está creada a USD 0.99/mes y el
  producto no consumible `remove_ads_lifetime` a USD 9.99, ambos con precios
  equivalentes y disponibilidad internacional. Sus localizaciones es-MX,
  en-US y pt-BR están guardadas.
- Los acuerdos de apps gratuitas y de pago están activos para 175 países o
  regiones. La cuenta bancaria Banistmo USD y los formularios fiscales
  W-8BEN/Foreign Status figuran activos en App Store Connect.
- Los tres estados bancarios recientes se comprobaron fuera del repositorio.
  Sus datos solo deben introducirse en el formulario oficial de Apple cuando
  el acuerdo habilite Banco e Impuestos; no se almacenan aquí.
- Google Play tiene activo `remove_ads_monthly`, plan `monthly-v1`, mensual
  con renovación automática. Se consultó sin guardar cambios.
- La consola muestra **174 selecciones**: la lista contiene **173 países o
  regiones con nombre y la opción de países/regiones nuevos**. No confundir
  este contador con 174 territorios Apple ni con disponibilidad efectiva de
  la app. Hay que contrastar los territorios por identidad y verificar la
  distribución de la app separadamente.
- Los precios observados en Panamá y Estados Unidos son `USD 0.99`. El valor
  para nuevos países del grupo USD es `USD 1.00`. Se conserva la referencia
  completa en `PLAY_STORE_REFERENCE.json`; no se modificaron precios Android.
- RevenueCat, proyecto `9884dbf1`, contiene la app iOS de StreamBeat. Los
  productos App Store mensual y de por vida están asociados al entitlement
  `remove_ads` y a los packages `$rc_monthly` y `$rc_lifetime` del offering
  `default`.
- Las credenciales de compras de App Store cargadas en RevenueCat figuran
  válidas. La llave privada permanece fuera del repositorio.
- La app iOS y el banner de producción ya existen en AdMob bajo la cuenta
  correcta. El App ID quedó aplicado en `Info.plist` y el banner en la
  configuración local ignorada por Git.
- La clave pública iOS `appl_*` está en la configuración local ignorada por
  Git y el verificador local iOS termina correctamente.

## Identidad y alcance

- Inscripción individual, confirmada por el titular. Usar la cuenta Apple que
  proporcionó en la conversación; no almacenar contraseñas, códigos, llaves
  privadas ni datos bancarios en este repositorio.
- Bundle ID existente: `com.victorflores.streambeat`.
- Versión actual del código: `1.1.15+19`. No implica una versión publicada en iOS.
- Mantener Android y sus lanzamientos intactos.
- Idiomas objetivo: español de México (`es-MX`, equivalente editorial de
  `es-419`), inglés de EE. UU. (`en-US`) y portugués de Brasil (`pt-BR`).
- Aplicación gratuita con suscripción mensual opcional para quitar el banner
  de StreamBeat. No elimina la publicidad emitida por las propias radios.

## Comprobado localmente

- Xcode 26.6 y Flutter 3.47.2 instalados.
- La app compila para el simulador iOS con la configuración local actual.
- El IPA firmado y procesado por App Store Connect contiene
  `com.victorflores.streambeat`, versión `1.1.15`, build `19`, Sign in with
  Apple y firma de distribución del equipo `MTL4YJMX73`.
- La suite completa termina con 164 pruebas correctas; `flutter analyze` no
  informa incidencias. Privacidad y EULA enlazadas responden HTTP 200.
- RevenueCat ya selecciona la clave pública correspondiente a Android o iOS.
- Se conserva `remove_ads` como entitlement y `remove_ads_monthly` como producto.
- La pantalla muestra el precio devuelto por la tienda, sin inventar un precio
  cuando el catálogo está inaccesible, y desactiva la compra hasta recibirlo.
- Gestión/cancelación usa la tienda de la compra, no la del dispositivo actual.
- Hay enlaces de privacidad y, en iOS, EULA estándar y explicación de renovación.
- Hay un verificador local específico para iOS, además del de Android.

## Puertas de publicación pendientes

### Cuenta y contratos

- [x] Comprobar si la cuenta ya tiene membresía activa antes de crear otra:
  la cuenta existente solicitaba inscribirse; se reutilizó sin crear duplicados.
- [x] Completar la inscripción individual y habilitar el acceso a App Store
  Connect.
- [x] Aceptar el Apple Developer Program License Agreement con confirmación
  específica del titular.
- [x] Confirmar que la cuenta ya puede crear y administrar la app en App Store
  Connect.
- [x] Aceptar App Store Connect Terms of Service con confirmación específica.
- [x] Corregir la entidad legal y aceptar Paid Apps Agreement.
- [x] Completar el cuestionario fiscal y confirmar activos el W-8BEN, la
  certificación de estatus extranjero y la cuenta bancaria Banistmo USD.
- [x] Confirmar en el IPA que el equipo de firma es `MTL4YJMX73`.

### App Store Connect y monetización

- [x] Registrar/verificar el Bundle ID y crear el registro iOS sin duplicados.
- [x] Crear un grupo de suscripción y `remove_ads_monthly`, duración de un mes.
- [x] Configurar `remove_ads_monthly` a USD 0.99/mes con equivalencias de Apple
  y disponibilidad internacional.
- [x] Crear `remove_ads_lifetime` como no consumible a USD 9.99 con equivalencias
  de Apple, disponibilidad internacional y localizaciones es-MX/en-US/pt-BR.
- [x] Asociar los productos iOS al entitlement `remove_ads` y a los packages
  `$rc_monthly` y `$rc_lifetime` del offering `default` en RevenueCat.
- [x] Configurar credenciales In-App Purchase válidas en RevenueCat y mantener
  la llave privada fuera del cliente y del repositorio.
- [x] Completar `REVENUECAT_IOS_API_KEY` con la clave pública `appl_*` real en
  la configuración local ignorada por Git.
- [x] Configurar en producción y sandbox las notificaciones de servidor de
  App Store mediante el endpoint de RevenueCat.
- [x] Crear/verificar la app iOS y su banner en AdMob; completar
  `ADMOB_IOS_BANNER_ID` y reemplazar el ID de prueba `GADApplicationIdentifier`
  en `ios/Runner/Info.plist`.
- [ ] Verificar el consentimiento UMP y el comportamiento sin consentimiento;
  determinar si el tratamiento real exige ATT antes de habilitar seguimiento.

### Acceso, privacidad y revisión

- [x] Añadir la opción nativa Sign in with Apple sin retirar Google ni reducir
  funciones; falta validarla en hardware.
- [x] Configurar el proveedor Apple en Supabase con el Bundle ID correcto,
  habilitar la capacidad de Apple en firma y cubrir el nonce con pruebas.
- [ ] Validar en hardware la eliminación de cuenta y revocación de tokens de
  Apple. El flujo actual ya implementa la revocación antes de borrar la cuenta.
- [ ] Revisar privacidad, manifiestos de SDK y APIs con motivos requeridos a
  partir del archivo final; no declarar "no se recopilan datos" por defecto.
- [ ] Revisar permisos, sus textos localizados y reproducción en segundo plano.
- [ ] Completar las respuestas de edad y contenido y confirmar los derechos
  de las fuentes de radio en los territorios de distribución elegidos.
- [x] Guardar las fichas de versión es-MX, en-US y pt-BR y la información
  general de la app.
- [ ] Subir a App Store Connect las capturas **reales de iOS** ya preparadas
  para iPhone y iPad. No reutilizar capturas Android como si fueran iOS.
- [ ] Facilitar acceso de revisión a funciones de cuenta sin publicar credenciales
  del titular. Revisar la política de privacidad publicada, no solo el archivo local.

### Verificación y envío

- [ ] En Sandbox/TestFlight: compra, renovación, cancelación, expiración,
  restauración, reinstalación y acceso de una misma cuenta en Android/iOS.
- [ ] Confirmar que no se solicita comprar otra vez con un entitlement activo.
- [ ] Confirmar que una cuenta eliminada deja de acceder a datos y que eliminarla
  no presenta la suscripción como cancelada automáticamente.
- [x] Crear y verificar el archivo de distribución firmado: identificador,
  versión/build, capacidad Apple, manifiestos de privacidad y firma.
- [x] Subir y procesar el build `1.1.15 (19)` en App Store Connect.
- [ ] Verificar reproducción, anuncios, acceso Apple y compras sandbox en hardware.
- [ ] Enviar app y primera suscripción a revisión y atender las observaciones.
- [ ] Confirmar publicación real y disponibilidad internacional en App Store Connect.

## Comandos de verificación

Desde la raíz real del proyecto (`/Users/victorflores/beats`):

```sh
dart run tool/verify_monetization_config.dart --platform=android
dart run tool/verify_monetization_config.dart --platform=ios
flutter analyze --no-pub
flutter test --no-pub
flutter build ios --simulator --debug --no-pub --dart-define-from-file=config/monetization.local.json
```

El verificador iOS termina correctamente con la configuración local actual. Su
éxito solo cubre coherencia local; no reemplaza las puertas remotas y pruebas
anteriores.

## Fuentes de requisitos

- [Inscripción y membresía Apple](https://developer.apple.com/programs/enroll/).
- [SDKs requeridos para los envíos](https://developer.apple.com/news/upcoming-requirements/).
- [Guías de revisión, especialmente 3.1.2, 4.8 y 5.1.1](https://developer.apple.com/app-store/review/guidelines/).
- [EULA estándar o personalizado](https://developer.apple.com/help/app-store-connect/manage-app-information/provide-a-custom-license-agreement/).
- [Acceso nativo Apple con Supabase](https://supabase.com/docs/reference/dart/auth-signinwithidtoken).
- [SDK de RevenueCat para Flutter](https://github.com/RevenueCat/purchases-flutter).

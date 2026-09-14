# StreamBeat — registro de preparación inicial del App Store

Este documento conserva las observaciones del 2 de septiembre de 2026. No
representa el estado actual de las cuentas, la firma ni los productos publicados.
La rama `store` ya incluye Premium mensual y de por vida; la nube requiere
una suscripción mensual vigente. Antes de continuar, verificar las consolas
y seguir la configuración actual del repositorio.

Estado al 2 de septiembre de 2026: **inscripción individual iniciada; contrato
Apple Developer Program aceptado con autorización del titular; membresía pendiente
del pago de USD 99 por un año**. No publicado ni enviado a revisión. Una
compilación o prueba local correcta no confirma los productos remotos, la firma
ni la aprobación de Apple.

## Verificación remota de esta inscripción

- Apple mostró `Complete Your Order`, total `US$ 99`, y solicitó tarjeta y
  datos de facturación. Se pidió al titular completar el pago directamente;
  esta tarea no introdujo datos de tarjeta ni realizó el cargo.
- App Store Connect mostró un contrato adicional, `App Store Connect Terms
  of Service` (V100). El titular autorizó expresamente su aceptación; se marcó
  la casilla y se pulsó `Agree`. El diálogo se cerró y abrió `/apps`.
- Al recargar App Store Connect, Apple mostró `Your Apple Account isn't
  enabled for App Store Connect.` La página de pago sigue en `Complete Your
  Order`; no hay activación verificada ni acceso para crear app/suscripción.
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
- RevenueCat, proyecto `9884dbf1`, solo muestra la app Play Store. El offering
  `default` tiene el package `$rc_monthly`, con producto Android
  `remove_ads_monthly:monthly-v1`. Existe el entitlement `remove_ads`.
- La sesión de RevenueCat muestra `You don't have permission to add app
  configurations.` Se necesita acceso con permiso para añadir la app iOS;
  no se intentó eludir esa restricción ni se creó otra organización/proyecto.
- El verificador iOS se ejecutó de nuevo y falla por la clave pública iOS
  de RevenueCat, el banner iOS de AdMob y el App ID AdMob aún de prueba.
- El acceso actual a AdMob abrió una pantalla de cuenta sin fecha de nacimiento;
  no se modificó la cuenta Google ni se configuraron anuncios iOS. Retomar con
  la cuenta que administra la app Android.

## Identidad y alcance

- Inscripción individual, confirmada por el titular. Usar la cuenta Apple que
  proporcionó en la conversación; no almacenar contraseñas, códigos, llaves
  privadas ni datos bancarios en este repositorio.
- Bundle ID existente: `com.victorflores.streambeat`.
- Versión actual del código: `1.1.8+12`. No implica una versión publicada en iOS.
- Mantener Android y sus lanzamientos intactos.
- Idiomas objetivo: español de México (`es-MX`, equivalente editorial de
  `es-419`), inglés de EE. UU. (`en-US`) y portugués de Brasil (`pt-BR`).
- Aplicación gratuita con suscripción mensual opcional para quitar el banner
  de StreamBeat. No elimina la publicidad emitida por las propias radios.

## Comprobado localmente

- Xcode 26.6 y Flutter 3.47.2 instalados.
- La app compila para el simulador iOS con la configuración local actual.
- Verificación del artefacto: `com.victorflores.streambeat`, versión `1.1.8`,
  build `12`. No es un archivo firmado para distribución.
- La suite completa termina con 104 pruebas correctas; `flutter analyze` no
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
- [ ] Completar la inscripción individual y la verificación de identidad.
- [x] Aceptar el Apple Developer Program License Agreement con confirmación
  específica del titular.
- [ ] Completar el pago mostrado de USD 99/año y verificar la activación real
  de la membresía; no se ha efectuado ningún pago por esta tarea.
- [x] Aceptar App Store Connect Terms of Service con confirmación específica.
- [ ] Completar Paid Apps Agreement, impuestos y cuenta bancaria para cobrar.
- [ ] Confirmar que el equipo de firma seleccionado pertenece al titular.

### App Store Connect y monetización

- [ ] Registrar/verificar el Bundle ID y crear el registro iOS sin duplicados.
- [ ] Crear un grupo de suscripción y `remove_ads_monthly`, duración de un mes.
- [ ] Elegir el punto de precio disponible equivalente al precio base Android
  (objetivo USD 1/mes); verificar moneda e impuestos en cada tienda. No sustituir
  este valor por otro punto sin comprobar los precios ofrecidos por Apple.
- [ ] Asociar el producto iOS al entitlement `remove_ads` y al package
  `$rc_monthly` del offering correspondiente en RevenueCat.
- [ ] Configurar las credenciales App Store/In-App Purchase y las notificaciones
  de servidor según la guía de RevenueCat. Mantener las llaves privadas fuera
  del cliente y del repositorio.
- [ ] Completar `REVENUECAT_IOS_API_KEY` con la clave pública `appl_*` real.
- [ ] Crear/verificar la app iOS y su banner en AdMob; completar
  `ADMOB_IOS_BANNER_ID` y reemplazar el ID de prueba `GADApplicationIdentifier`
  en `ios/Runner/Info.plist`. El verificador rechaza IDs de prueba.
- [ ] Verificar el consentimiento UMP y el comportamiento sin consentimiento;
  determinar si el tratamiento real exige ATT antes de habilitar seguimiento.

### Acceso, privacidad y revisión

- [ ] Añadir y verificar una opción de acceso equivalente a Google que cumpla
  la guía 4.8 (Sign in with Apple), sin retirar Google ni reducir funciones.
- [ ] Configurar el proveedor Apple en Supabase con el Bundle ID correcto,
  habilitar la capacidad de Apple en firma y probar la validación del nonce.
- [ ] Verificar eliminación de cuenta y revocación de tokens Apple antes de
  permitir registros Apple en producción. El flujo actual no implementa Apple.
- [ ] Revisar privacidad, manifiestos de SDK y APIs con motivos requeridos a
  partir del archivo final; no declarar "no se recopilan datos" por defecto.
- [ ] Revisar permisos, sus textos localizados y reproducción en segundo plano.
- [ ] Completar las respuestas de edad y contenido y confirmar los derechos
  de las fuentes de radio en los territorios de distribución elegidos.
- [ ] Preparar ficha es-MX/en-US/pt-BR y capturas **reales de iOS**, incluyendo
  iPad si continúa habilitado. No reutilizar capturas Android como si fueran iOS.
- [ ] Facilitar acceso de revisión a funciones de cuenta sin publicar credenciales
  del titular. Revisar la política de privacidad publicada, no solo el archivo local.

### Verificación y envío

- [ ] En Sandbox/TestFlight: compra, renovación, cancelación, expiración,
  restauración, reinstalación y acceso de una misma cuenta en Android/iOS.
- [ ] Confirmar que no se solicita comprar otra vez con un entitlement activo.
- [ ] Confirmar que una cuenta eliminada deja de acceder a datos y que eliminarla
  no presenta la suscripción como cancelada automáticamente.
- [ ] Crear archivo de distribución firmado; verificar identificadores,
  iconos, versión, privacidad y configuración de producción del artefacto.
- [ ] Subir a TestFlight y verificar reproducción, anuncios y compras en hardware.
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

El verificador iOS **debe fallar** hasta completar los IDs pendientes. Su éxito
solo cubre coherencia local; no reemplaza las puertas remotas y pruebas anteriores.

## Fuentes de requisitos

- [Inscripción y membresía Apple](https://developer.apple.com/programs/enroll/).
- [SDKs requeridos para los envíos](https://developer.apple.com/news/upcoming-requirements/).
- [Guías de revisión, especialmente 3.1.2, 4.8 y 5.1.1](https://developer.apple.com/app-store/review/guidelines/).
- [EULA estándar o personalizado](https://developer.apple.com/help/app-store-connect/manage-app-information/provide-a-custom-license-agreement/).
- [Acceso nativo Apple con Supabase](https://supabase.com/docs/reference/dart/auth-signinwithidtoken).
- [SDK de RevenueCat para Flutter](https://github.com/RevenueCat/purchases-flutter).

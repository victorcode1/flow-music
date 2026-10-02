# Monetización de StreamBeat

StreamBeat usa un modelo freemium deliberadamente discreto:

- La versión gratuita muestra como máximo un banner adaptativo de AdMob.
- El banner no cubre los controles y puede aparecer durante la reproducción.
- Aportes voluntarios de US$0.99, US$2.99 y US$4.99 (precio base estadounidense;
  la tienda muestra el precio y moneda de cada región).
- Productos no consumibles `streambeat_support_small`,
  `streambeat_support_medium` y `streambeat_support_large`. Cualquier importe
  activa `remove_ads`, sin renovación automática. No se venden mensualidad
  ni una opción llamada Premium de por vida.
- Los aportes no eliminan anuncios de las propias emisoras. Ninguna compra
  habilita almacenamiento o sincronización en la nube: la biblioteca es local.
- Cada producto se compra una vez y el beneficio puede restaurarse sin cuenta.
- Compras anteriores conservan sus derechos; no se desconectan los productos
  históricos del entitlement. Las mensualidades antiguas se reconocen solo
  para mantener/cancelar el acceso existente, sin ofertarlas de nuevo.
- No hay intersticiales, anuncios de apertura ni recompensados.

## Límites de arquitectura

El dominio depende de `AuthRepository`, `CustomerProfileRepository`,
`SubscriptionRepository` y `AdConsentRepository`. Supabase, RevenueCat y AdMob
son adaptadores reemplazables. Aportar y restaurar el beneficio sin anuncios no requiere cuenta.
RevenueCat mantiene una identidad anónima persistente para esos usuarios y los
derechos de la tienda eliminan anuncios también sin sesión. Al iniciar sesión
opcionalmente, el UID de Supabase se usa como `appUserID` de RevenueCat. La
cuenta sirve para el perfil y las compras; no guarda la biblioteca.

Para reinstalación y restauración sin cuenta, verificar en RevenueCat que el
comportamiento de restauración sea **Transfer to new App User ID**, como indica
[su documentación](https://www.revenuecat.com/docs/projects/restore-behavior).
No cambiar esta política sin revisar las consecuencias para cuentas existentes.

RevenueCat es la fuente operativa para desbloquear la app. El webhook
`revenuecat-webhook` mantiene un modelo de lectura en PostgreSQL. El cliente
solo puede leer su propia fila mediante RLS y nunca puede concederse Premium.

El nuevo cliente utiliza explícitamente el offering `support`. El offering
`default` no se altera para evitar afectar clientes publicados antes de esta
migración. Los tres productos deben estar conectados a `remove_ads` y al
nuevo offering antes de distribuir esta versión.

## Variables de compilación

Copiar `config/monetization.example.json` a
`config/monetization.local.json` y completar solo claves públicas. Compilar con:

    dart run tool/verify_monetization_config.dart
    flutter build appbundle --release \
      --dart-define-from-file=config/monetization.local.json

Los secretos `REVENUECAT_WEBHOOK_AUTH` y `SUPABASE_SERVICE_ROLE_KEY` viven solo
en Supabase Edge Functions. Nunca deben incluirse en Flutter.

`GOOGLE_WEB_CLIENT_ID` y `GOOGLE_IOS_CLIENT_ID` son identificadores OAuth
públicos y pueden viajar en el binario. El secreto del cliente OAuth web se
guarda únicamente en el proveedor Google de Supabase Auth.

## Supabase

La migración versionada crea `profiles`, `subscription_entitlements` y el
registro idempotente de webhooks. Todas las tablas tienen RLS y privilegios
explícitos. Las funciones son:

- `revenuecat-webhook`: JWT desactivado únicamente porque valida el valor
  exacto del encabezado `Authorization` configurado en RevenueCat.
- `delete-account`: requiere JWT de Supabase, vuelve a validar el usuario y
  elimina la cuenta con el cliente administrativo.

El límite de intentos de login de la app es solo una protección local; no
sustituye los límites de Supabase Auth ni un CAPTCHA. CAPTCHA y el panel de
rentabilidad siguen pendientes de integración/acceso a fuentes reales. No
se han habilitado planes de pago ni se han usado ingresos sandbox como reales.

Las claves de servicio y el secreto de webhook siguen exclusivamente en Supabase.

Agregar `com.victorflores.streambeat://auth-callback` a las URL de redirección
de Auth. Mantener confirmación de correo activada en producción.

Para Google Sign-In, registrar en Google Auth Platform el paquete Android
`com.victorflores.streambeat` con los SHA-1 de Play App Signing y de debug,
crear un cliente OAuth web para obtener el ID token y habilitar Google en
Supabase Auth. En iOS se agrega además el cliente del bundle y su esquema URL
invertido.

En el proyecto remoto, configurar también los secretos
`REVENUECAT_WEBHOOK_AUTH` y `REVENUECAT_ENTITLEMENT_ID=remove_ads`. El webhook
de RevenueCat debe apuntar a
`https://afgpugpnapajemftfbzz.supabase.co/functions/v1/revenuecat-webhook`.

## Datos de uso locales

Favoritos, playlists, preferencias e historial se guardan solo en el
dispositivo y funcionan sin red. No hay respaldo remoto, sincronización entre
dispositivos ni opción de compra que los habilite. Cada biblioteca local queda
aislada por cuenta: cerrar sesión la archiva localmente bajo el UID para no
mezclarla con otra cuenta, y vuelve a mostrarse al entrar con la misma cuenta
en ese dispositivo. Eliminar la cuenta borra también su biblioteca local.
Configuración no muestra estado de nube, sincronización manual ni exportación
de copias remotas; permite exportar la biblioteca local como JSON mediante el
menú de compartir, tras advertir que las URLs de emisoras personalizadas pueden
incluir información privada.

## Infraestructura histórica de nube

Versiones anteriores ofrecían una copia en la nube a mensualidades históricas
mediante la función `cloud-sync-access`, la tabla `cloud_subscription_access`,
`cloud_library`, `user_data_sync` y una limpieza diaria de retención. Desde esta
versión la app no invoca esas funciones ni depende de esas tablas, y sus
migraciones no forman parte del flujo de esta versión. La prueba
`supabase/tests/paid_cloud_sync.sql` y la variable `REVENUECAT_CLOUD_API_KEY`
pertenecen a esa infraestructura. Esta versión no borra datos remotos guardados
antes ni retira esa infraestructura; hacerlo requiere un cambio de backend aparte.

## Tiendas y RevenueCat

1. Mantener el entitlement `remove_ads` en RevenueCat.
2. Crear los tres productos no consumibles `streambeat_support_small`,
   `streambeat_support_medium` y `streambeat_support_large`, con precios base
   estadounidenses de US$0.99, US$2.99 y US$4.99, respectivamente.
3. Asociar cada producto a `remove_ads` y a su package `small`, `medium` o
   `large` del offering `support` en la plataforma correspondiente.
4. Conservar los productos históricos y sus derechos para clientes anteriores.
5. Configurar el webhook de RevenueCat con el encabezado secreto exacto y
   probar compra y restauración con usuarios sandbox.

El 2 de octubre de 2026 se activaron los tres aportes Android en las 174
regiones de facturación admitidas por Google Play, con precios locales e
impuestos calculados por la tienda. Se importaron en RevenueCat como no
consumibles y se vincularon a `remove_ads` y a `support`. La configuración del
catálogo no sustituye una prueba de compra real o sandbox en un dispositivo.

Google Play requiere que primero exista un AAB que incluya Play Billing. Apple
y Google deben mostrar y procesar el pago; una pasarela web directa no cumple
las reglas generales para quitar anuncios, que es una función digital.

## AdMob y privacidad

Los builds debug usan IDs de prueba oficiales. Android ya tiene configurado el
application ID de StreamBeat; iOS seguirá sin anuncios de producción hasta que
se cree su app y se reemplace `GADApplicationIdentifier`. UMP se consulta en
cada arranque, no se solicita un anuncio hasta que `canRequestAds` lo permite,
y Ajustes muestra la entrada de privacidad cuando sea obligatoria.

AdMob exige que `app-ads.txt` exista en la raíz del dominio publicado como sitio
del desarrollador. El archivo versionado está en `docs/app-ads.txt`, pero con el
sitio actual de GitHub Pages debe quedar accesible exactamente en
`https://victorcode1.github.io/app-ads.txt`; publicarlo solo bajo
`/flow-music/app-ads.txt` no completa la verificación.

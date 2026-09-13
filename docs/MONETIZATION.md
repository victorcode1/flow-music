# Monetización de StreamBeat

StreamBeat usa un modelo freemium deliberadamente discreto:

- La versión gratuita muestra como máximo un banner adaptativo de AdMob.
- El banner no cubre los controles y puede aparecer durante la reproducción.
- `remove_ads_monthly` elimina anuncios e incluye copia y sincronización de
  favoritos, playlists y preferencias. El precio se obtiene de la tienda.
- `remove_ads_lifetime` elimina los anuncios con un pago único. No incluye nube;
  un comprador de por vida puede contratar la mensualidad para añadirla.
- No hay intersticiales, anuncios de apertura ni recompensados.

## Límites de arquitectura

El dominio depende de `AuthRepository`, `CustomerProfileRepository`,
`SubscriptionRepository` y `AdConsentRepository`. Supabase, RevenueCat y AdMob
son adaptadores reemplazables. El UID de Supabase es el `appUserID` de
RevenueCat, por lo que la compra vuelve al iniciar sesión en otro dispositivo.

RevenueCat es la fuente operativa para desbloquear la app. El webhook
`revenuecat-webhook` mantiene un modelo de lectura en PostgreSQL. El cliente
solo puede leer su propia fila mediante RLS y nunca puede concederse Premium.

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
- `cloud-sync-access`: requiere JWT, verifica la identidad con Supabase Auth
  y consulta RevenueCat desde el servidor. No acepta un UID ni un estado de
  pago suministrados por la app.

La tabla `cloud_subscription_access` está separada del entitlement para anuncios.
Solo se habilita con períodos mensuales de producción no reembolsados; se excluyen
pruebas sandbox, períodos trial, compras vitalicias y extensiones de gracia no
pagadas. Cancelar la renovación mantiene los días pagados. Cada verificación
vence como máximo a las 24 horas o al terminar el período, lo que ocurra primero.
La app revalida al entrar, comprar/restaurar, volver a primer plano y cuando
vence su permiso. El webhook consulta el estado actual de RevenueCat, incluidas
ambas cuentas en transferencias, y no interpreta un evento viejo como un pago nuevo.

`user_data_sync_requires_paid_monthly` es una política RLS restrictiva y se
combina con la propiedad de la fila. El acceso directo de clientes a
`user_data_sync` está revocado: la app usa `cloud_library`, que obtiene el
propietario de `auth.uid()` y aplica autorización y límites en el servidor.
Una cuenta gratuita no puede sincronizar su biblioteca, aunque use un cliente
antiguo o modificado. La exportación explícita de una copia propia existente
se permite sin renovar como función de portabilidad, con su propio límite.
Los cambios locales se agrupan durante dos segundos. No se mantiene un listener
Realtime ni se suben snapshots sin cambios. Auth, perfiles y analítica conservan
su funcionamiento previo; esta restricción no elimina sus costos de operación.

Las copias admiten 500 favoritos, 200 playlists y 2 MiB por cuenta. Los límites
de lectura son 120/hora y 1000/día; escritura 60/hora y 300/día; gestión y
verificación 30/hora y 120/día; exportación 3/hora y 10/día. Los contadores
privados tienen una fila por cuenta/operación, no un registro ilimitado de cada
petición. El cliente conserva cambios locales al alcanzar un límite.

Al vencer la suscripción se pausa la sincronización. La limpieza diaria a las
07:15 UTC solo puede borrar copias con pago vencido hace 90 días o más, aviso
confirmado en la app hace al menos 30 días y verificación de acceso menor a
24 horas. Si falta cualquiera de estas condiciones, no se borra la copia.
No existe un proceso que renueve por sí solo esa verificación: la limpieza
puede aplazarse indefinidamente cuando no hay una verificación reciente.
Renovar cancela la retención; eliminar la cuenta borra sus datos por cascada.
El historial de reproducción siempre permanece local. Cerrar sesión archiva
localmente la biblioteca bajo el UID para no perder cambios sin conexión ni
mezclarlos con otra cuenta.

Configuración muestra la última sincronización correcta y permite exportar
la biblioteca local como JSON. Consultar la copia remota requiere una acción
explícita; no hay sondeo automático para cuentas gratuitas. Las peticiones
fijan el token de la cuenta capturada para evitar cruces al cambiar de sesión.
La exportación advierte que las URLs de emisoras personalizadas pueden incluir
información privada antes de abrir el menú de compartir.

El límite de intentos de login de la app es solo una protección local; no
sustituye los límites de Supabase Auth ni un CAPTCHA. CAPTCHA y el panel de
rentabilidad siguen pendientes de integración/acceso a fuentes reales. No
se han habilitado planes de pago ni se han usado ingresos sandbox como reales.

La función usa la clave SDK **pública** de StreamBeat, que solo se utiliza para
consultar Customer Info; puede reemplazarse mediante `REVENUECAT_CLOUD_API_KEY`.
Las claves de servicio y el secreto de webhook siguen exclusivamente en Supabase.
Para comprobar RLS sin conservar usuarios sintéticos, ejecutar el archivo
`supabase/tests/paid_cloud_sync.sql`, que incluye BEGIN/ROLLBACK.

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

## Tiendas y RevenueCat

1. Crear en Google Play y App Store el producto `remove_ads_monthly`, mensual,
   con precio base USD 1.
2. Crear el entitlement `remove_ads` en RevenueCat.
3. Asociar el producto mensual al package `$rc_monthly` del offering actual.
4. Configurar el webhook de RevenueCat con el encabezado secreto exacto.
5. Probar compra, cancelación y restauración con usuarios sandbox antes de
   publicar.

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

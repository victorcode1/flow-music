# Monetización de StreamBeat

StreamBeat usa un modelo freemium deliberadamente discreto:

- La versión gratuita muestra como máximo un banner adaptativo de AdMob.
- El banner no cubre contenido y se oculta mientras hay una emisora activa.
- `remove_ads_monthly` elimina anuncios por USD 1 al mes (precio base; la
  tienda aplica moneda local e impuestos).
- No hay intersticiales, anuncios de apertura, recompensados ni recordatorios
  emergentes.

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

## Supabase

La migración versionada crea `profiles`, `subscription_entitlements` y el
registro idempotente de webhooks. Todas las tablas tienen RLS y privilegios
explícitos. Las funciones son:

- `revenuecat-webhook`: JWT desactivado únicamente porque valida el valor
  exacto del encabezado `Authorization` configurado en RevenueCat.
- `delete-account`: requiere JWT de Supabase, vuelve a validar el usuario y
  elimina la cuenta con el cliente administrativo.

Agregar `com.victorflores.streambeat://auth-callback` a las URL de redirección
de Auth. Mantener confirmación de correo activada en producción.

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

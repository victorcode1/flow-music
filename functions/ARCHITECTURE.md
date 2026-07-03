# Flow Music Functions Architecture

Este documento define como debe evolucionar el backend de `functions/`.
Debe ser leido por cualquier persona o herramienta IA antes de modificar el
modulo. El objetivo es evitar que `src/index.ts` siga creciendo como archivo
monolitico y mantener una arquitectura facil de probar, extender y desplegar.

## Proposito

`functions/` contiene el backend serverless de Flow Music desplegado en
Firebase Cloud Functions v2 sobre Cloud Run.

El cliente publico de Flutter no debe depender de SDKs Firebase para consumir
servicios de aplicacion. El cliente debe hablar por HTTP contra URLs de
Functions. Firebase puede seguir existiendo del lado servidor como proveedor de
infraestructura, pero debe quedar encapsulado detras de servicios y
repositorios backend.

Responsabilidades actuales del backend:

- Autenticacion HTTP para el cliente Flutter.
- Bridge server-side hacia Firebase Auth para email/password, refresh token y
  verificacion de identidad.
- APIs HTTP autenticadas para datos de usuario que antes eran accedidos con
  `cloud_firestore` desde Flutter.
- Escritura de perfil basico en Firestore despues de registrar o iniciar
  sesion.
- Operaciones administrativas de ubicacion y limpieza de historiales.
- Jobs programados para mantenimiento de datos.

## Estado Actual

El backend ya esta separado en una estructura modular bajo `src/`:

- `config/`: inicializacion de Firebase y variables de entorno.
- `shared/`: errores y validaciones reutilizables.
- `modules/auth/`: autenticacion HTTP para el cliente Flutter.
- `modules/user-data/`: favoritos, playlists, radio favoritos, radio playlists
  y settings por HTTP autenticado.
- `modules/user-presence/`: presencia y sesiones por HTTP autenticado.
- `modules/location/`: operaciones admin de ubicacion y scheduler.
- `index.ts`: composition root que inicializa Firebase y reexporta Functions.

El refactor inicial movio la logica fuera del antiguo `src/index.ts`
monolitico. La deuda tecnica restante es seguir afinando los modulos grandes,
especialmente entrypoints con mucha validacion inline, y agregar pruebas
unitarias para casos de uso e infraestructura fake.

## Principios

### Clean Architecture

El backend debe separar entrada/salida de reglas de negocio:

- `entrypoints`: Cloud Functions, HTTP handlers y schedulers.
- `application`: casos de uso y orquestacion.
- `domain`: entidades, value objects, reglas puras y contratos.
- `infrastructure`: Firebase Admin, Firestore, Identity Toolkit, APIs externas.
- `shared`: utilidades transversales como errores, validacion y respuestas.

Las capas internas no deben importar detalles de las externas:

- `domain` no importa Firebase, HTTP ni Cloud Functions.
- `application` depende de contratos, no de SDKs concretos.
- `infrastructure` implementa contratos.
- `entrypoints` adapta requests/responses y llama casos de uso.

### SOLID

- Single Responsibility: un archivo debe tener una sola razon clara de cambio.
- Open/Closed: nuevos endpoints se agregan creando handlers/casos de uso, no
  modificando utilidades globales gigantes.
- Liskov: las implementaciones de repositorios y clientes deben cumplir sus
  contratos sin comportamiento sorpresa.
- Interface Segregation: contratos pequenos por capacidad, no interfaces
  enormes.
- Dependency Inversion: casos de uso dependen de interfaces, no de
  `firebase-admin`, `fetch` o Firestore directamente.

## Estructura

La estructura esperada para `src/` es:

```text
src/
  index.ts
  config/
    env.ts
    firebase.ts
  shared/
    errors/
      http-error.ts
    validation/
      primitives.ts
  modules/
    auth/
      entrypoints/
        auth.functions.ts
      application/
        auth-service.ts
      domain/
        auth-errors.ts
      infrastructure/
        identity-toolkit-client.ts
        user-profile-repository.ts
      dto/
        auth.dto.ts
      index.ts
    user-data/
      entrypoints/
        user-data.functions.ts
      application/
        user-data-service.ts
      index.ts
    user-presence/
      entrypoints/
        user-presence.functions.ts
      application/
        user-presence-service.ts
      index.ts
    location/
      entrypoints/
        location.functions.ts
      application/
        location-admin-service.ts
        location-scheduler-service.ts
      domain/
        location.types.ts
      index.ts
```

`src/index.ts` debe quedar como composition root:

- Inicializa Firebase una sola vez.
- Importa y reexporta Functions.
- No contiene logica de negocio.
- No contiene validaciones largas.
- No contiene llamadas directas a Firestore o Auth.

Ejemplo de responsabilidad aceptable para `index.ts`:

```ts
export {authLogin} from "./modules/auth";
export {authRegister} from "./modules/auth";
export {scheduledLocationHistoryCleanup} from "./modules/scheduler";
```

## Modulos

### Auth

El modulo de autenticacion expone endpoints HTTP publicos consumidos por el
cliente Flutter.

Endpoints actuales:

- `authRegister`: registra usuario con email/password y devuelve sesion.
- `authLogin`: inicia sesion con email/password y devuelve sesion.
- `authGoogleLogin`: recibe un Google ID token, lo intercambia server-side
  contra Identity Toolkit y devuelve sesion Flow Music.
- `authRefreshSession`: renueva `idToken` usando `refreshToken`.
- `authCurrentUser`: valida token y devuelve usuario actual.
- `authPasswordReset`: envia email de recuperacion de password.

Reglas:

- El cliente Flutter no usa `firebase_auth`.
- El cliente Flutter no llama `cloud_functions`.
- El cliente Flutter no necesita `firebase_core` para auth.
- El backend puede usar Firebase Auth Admin y REST API como detalle interno.
- Passwords nunca se registran en logs.
- Tokens nunca se imprimen en logs ni respuestas de error.
- El cliente puede usar Google Sign-In solo para obtener el Google ID token;
  el intercambio con Firebase Auth ocurre exclusivamente en Functions.
- Para tokens de app en endpoints publicos v2, preferir
  `x-flow-auth-token`. No usar `Authorization` para Firebase ID tokens en
  Cloud Run publico porque puede ser interceptado por la capa de invocacion.

### Location

El modulo de ubicacion administra datos de usuarios, historiales y permisos
de dashboard.

Reglas:

- Operaciones admin deben validar claims del usuario.
- Operaciones masivas deben usar batch paginado.
- El borrado de historiales debe tener limites claros y logs de conteo.
- La lectura/escritura directa de Firestore debe estar en infraestructura.

### User Data

`userDataApi` es el router HTTP autenticado para datos sincronizables del
usuario. El cliente envia `action` y un `resource` permitido; el backend valida
el Firebase ID token enviado en `x-flow-auth-token` y usa el UID del token, no
un UID enviado por el cliente.

Recursos permitidos:

- `favorites`: `users/{uid}/favorites/{videoId}`.
- `playlists`: `users/{uid}/playlists/{playlistId}`.
- `radioFavorites`: `users/{uid}/radioFavorites/{stationKey}`.
- `radioPlaylists`: `users/{uid}/radioPlaylists/{playlistId}`.
- `settings`: `users/{uid}/profile/settings`.

Acciones actuales:

- `read`
- `upsert`
- `delete`
- `replaceAll`

No crear endpoints que acepten rutas arbitrarias de Firestore. Todo recurso
debe estar en allowlist y tener reglas de identificacion controladas por el
backend.

### User Presence

`userPresenceApi` reemplaza la escritura directa de presencia con Firestore.
Acciones:

- `start`
- `update`
- `end`

La presencia siempre opera sobre el UID del token autenticado.

### Location HTTP

`locationApi` reemplaza las lecturas/escrituras de ubicacion que antes usaba
`cloud_firestore` y los callables que antes consumia `cloud_functions`.
Acciones de usuario autenticado:

- `readInterval`
- `saveIfDue`
- `readGlobalInterval`

Acciones admin, requieren claim `admin` o `locationAdmin`:

- `usersWithLocations`
- `anonymousUsers`
- `history`
- `readCleanupSchedule`
- `deleteHistoryEntry`
- `deleteAllUsersHistory`
- `setUserInterval`
- `setGlobalInterval`

### Location Realtime

El cliente normal no debe usar listeners Firestore ni SDKs Firebase. Para las
vistas admin que necesitan realtime, `locationApi` expone SSE sobre `GET` con
`x-flow-auth-token` y el query param `action`.

Streams soportados:

- `usersWithLocations`
- `anonymousUsers`
- `history` con `uid`
- `readCleanupSchedule`
- `readGlobalInterval`

El stream es de solo lectura. Toda mutacion sigue entrando por `POST` al mismo
router HTTP. No crear streams para datos de usuario normal salvo que exista una
necesidad realtime real y documentada.

### Scheduler

Los jobs programados no deben compartir handlers HTTP. Deben llamar casos de
uso reutilizables.

Reglas:

- El scheduler solo traduce el evento programado a un use case.
- El use case decide si corre, que borra y que actualiza.
- La zona horaria debe validarse como IANA timezone.

## Contratos HTTP

Los endpoints HTTP deben responder JSON siempre.

Respuesta exitosa:

```json
{
  "user": {
    "id": "uid",
    "email": "user@example.com",
    "displayName": "User",
    "photoUrl": null,
    "isAnonymous": false,
    "claims": {}
  },
  "session": {
    "idToken": "...",
    "refreshToken": "...",
    "expiresIn": 3600,
    "expiresAt": 1779816330000
  }
}
```

Respuesta de error:

```json
{
  "code": "invalid-credential",
  "message": "Invalid email or password."
}
```

Codigos esperados:

- `400`: request invalido.
- `401`: autenticacion faltante o invalida.
- `403`: autenticado, pero sin permisos.
- `404`: recurso inexistente.
- `409`: conflicto, por ejemplo email ya registrado.
- `429`: demasiados intentos.
- `500`: error inesperado o configuracion faltante.

No devolver stack traces al cliente.

## Configuracion

Variables actuales:

- `BOOTSTRAP_LOCATION_ADMIN_EMAILS`: emails autorizados para auto-asignarse
  acceso admin de ubicacion.
- `AUTH_WEB_API_KEY`: API key web usada server-side para Firebase Auth REST
  API.

Reglas:

- `.env.<project-id>` no se commitea.
- `.env.example` debe documentar toda variable requerida.
- Secrets reales no deben vivir en Git.
- Toda variable se lee desde `config/env.ts` en la estructura objetivo.
- Validar configuracion al inicio del caso de uso que la necesita.

## Seguridad

- Nunca loguear passwords, refresh tokens ni id tokens.
- Endpoints publicos deben tener CORS explicito.
- Endpoints publicos con escritura deben validar metodo HTTP.
- Operaciones admin deben verificar claims server-side.
- No confiar en flags enviados por el cliente para permisos.
- Mantener los errores de auth normalizados para evitar filtrar informacion
  sensible.
- Considerar rate limiting o App Check equivalente antes de abrir mas
  endpoints publicos de alto costo.

## Logging

Usar logs estructurados con `logger` de Firebase Functions.

Buenas practicas:

- Loguear `uid`, `operation`, `count`, `status`, `durationMs` cuando aplique.
- No loguear payloads completos.
- No loguear tokens ni passwords.
- Para errores esperados, log nivel `info` o `warn`.
- Para errores inesperados, log nivel `error` con contexto minimo.

## Testing

Antes de desplegar:

```bash
npm run build
```

Cuando existan tests backend:

```bash
npm test
```

Estandar esperado para nuevas features:

- Tests unitarios para use cases.
- Tests unitarios para validadores y mappers de errores.
- Tests con repositorios fake para application/domain.
- Tests de integracion solo cuando se pruebe infraestructura real o emulador.

No agregar logica nueva sin hacerla testeable fuera de Cloud Functions.

## Deploy

Deploy completo:

```bash
firebase deploy --only functions
```

Deploy de una Function:

```bash
firebase deploy --only functions:authLogin
```

Ver logs:

```bash
firebase functions:log --only authLogin --lines 50
```

Reglas:

- Ejecutar `npm run build` antes de deploy.
- Preferir deploy selectivo si solo cambio una Function.
- Confirmar URLs y hacer prueba smoke despues de deploy.
- No depender de `functions/lib/`; es salida generada por TypeScript.

## Smoke Tests Recomendados

Auth:

1. Registrar usuario con email temporal.
2. Iniciar sesion con ese usuario.
3. Renovar sesion con `refreshToken`.
4. Consultar `authCurrentUser` usando `x-flow-auth-token`.
5. Verificar que todos los pasos devuelven el mismo `uid`.

No imprimir tokens en consola durante pruebas compartidas.

## Guia Para Nuevas Features

Para agregar una feature:

1. Crear o ubicar modulo en `src/modules/<feature>`.
2. Definir tipos de dominio y contratos.
3. Crear caso de uso en `application`.
4. Crear adaptadores de infraestructura.
5. Crear entrypoint HTTP/callable/scheduler.
6. Exportar desde `modules/<feature>/index.ts`.
7. Reexportar desde `src/index.ts`.
8. Agregar pruebas unitarias donde aplique.
9. Actualizar este documento si cambia arquitectura o contrato publico.

## Reglas Para Herramientas IA

Cuando una herramienta IA trabaje en este modulo:

- Leer este archivo antes de modificar `src/`.
- No agregar mas logica a `src/index.ts` salvo exports temporales.
- Si toca un area todavia monolitica, preferir extraer una unidad pequena.
- No mezclar refactor amplio con cambio funcional de producto.
- Mantener compatibilidad con URLs ya desplegadas salvo instruccion explicita.
- No imprimir ni commitear tokens, API keys privadas, service accounts o
  archivos `.env.<project-id>`.
- Ejecutar `npm run build` despues de cambios TypeScript.
- Documentar endpoints nuevos y variables nuevas en este archivo y en
  `.env.example`.

## Deuda Tecnica Prioritaria

Orden recomendado:

1. Extraer auth de `src/index.ts` a `src/modules/auth`.
2. Extraer helpers HTTP y errores a `src/shared`.
3. Extraer location admin a `src/modules/location`.
4. Extraer scheduler a `src/modules/scheduler`.
5. Agregar tests unitarios para auth use cases y error mappers.
6. Agregar scripts `test` y, si aplica, lint al `package.json`.

La meta final es que ningun archivo de aplicacion supere una responsabilidad
clara ni crezca por encima de un tamano razonable. Como regla practica, si un
archivo pasa de 200-250 lineas, revisar si mezcla responsabilidades.

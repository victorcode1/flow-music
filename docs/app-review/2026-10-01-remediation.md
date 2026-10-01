# App Review: candidato de corrección del 1 de octubre de 2026

## Alcance y estado

App Store Connect: 6811965825. Bundle iOS: com.victorflores.streambeat.
Apple rechazó 1.1.15 (22) el 1 de octubre por 5.1.1(v) y 5.2.3.
La corrección está en un worktree aislado basado en `store`, revisión
30424617a5896a41777475d7b0b3277cc46e671d. No se modifica `main`.

## Historial del candidato 23 (sustituido; no subir)

- Compra mensual y vitalicia directamente desde Configuración, sin cuenta.
- Restauración accesible sin cuenta, incluso sin precios cargados.
- La disponibilidad de Supabase Auth no bloquea compras de la tienda.
- Los derechos Premium de RevenueCat activan la experiencia sin anuncios
  también para la identidad anónima; vencimiento mensual sigue aplicándose.
- Registro e inicio de sesión son opcionales. Solo la biblioteca en la nube
  requiere cuenta y suscripción mensual vigente verificada en el servidor.
- Textos de cuenta corregidos en español, inglés y portugués brasileño;
  política de privacidad local actualizada en español e inglés.

RevenueCat admite identidad anónima y asociación mediante `logIn`:
https://www.revenuecat.com/docs/customers/identifying-customers
La restauración con cuenta opcional necesita revisar `Transfer to new App User ID`:
https://www.revenuecat.com/docs/projects/restore-behavior
No se ha inspeccionado ni modificado esa configuración remota.

## Evidencia local del candidato anterior

- Monetización y traducciones: 60 pruebas aprobadas.
- Cuenta, biblioteca, promoción y configuración: 33 pruebas aprobadas.
- Análisis de módulo y pruebas de monetización: sin incidencias.
- `dart run tool/verify_monetization_config.dart --platform=ios`: correcto.
- Compilación debug iOS, arranque y recarga en caliente: correctos.
- En el simulador, la compra mensual abrió el login de Apple sin abrir el
  formulario de registro de StreamBeat. Se canceló sin introducir credenciales
  ni efectuar el pago. Esto no prueba una transacción sandbox completa.
- Archivo iOS y exportación IPA de distribución: 1.1.15 (23), correctos.
  Bundle y versión verificados también dentro del IPA. No se ha subido a Apple.
- Estos checks no prueban transacciones reales de Apple ni la política remota.

## Comprobaciones pendientes (adaptadas al candidato 24)

1. Probar los tres aportes como invitado con Apple sandbox.
2. Comprobar que los anuncios desaparezcan y Premium persista tras reiniciar.
3. Probar restauración sin cuenta después de reinstalación, en otro dispositivo
   con la misma cuenta de la tienda y tras cerrar sesión en la app.
4. Probar vincular una compra de invitado al iniciar sesión opcionalmente,
   restaurar con una cuenta existente y cambiar de cuenta sin cruzar biblioteca.
5. Verificar en RevenueCat la política remota de restauración indicada arriba.
6. Revisar y firmar personalmente el PDF de relación desarrollador-app.
7. Adjuntar permisos reales de contenido o pedir aclaración a Apple antes de
   presentar 5.2.3 como resuelto. La documentación de Radio Browser sobre su
   directorio no acredita derechos sobre las emisiones subyacentes.
8. Subir/seleccionar el build corregido solo después de verificar el candidato,
   publicar la política de privacidad actualizada cuando se autorice el push,
   y reenviar con documentación suficiente. No afirmar aprobación ni publicación.

## Borrador inicial de respuesta (reemplazado por aclaración enviada)

Hello App Review,

Thank you for the October 1 review of StreamBeat 1.1.15 (22).

For guideline 5.1.1(v), we have corrected the purchase flow in our candidate:
users can purchase monthly or lifetime Premium and restore purchases without
registering or signing in. Store entitlements enable the ad-free experience
for guests. Registration is optional and used for account-specific cloud
library backup and synchronization. We will submit the corrected build after
sandbox validation.

For the requested relationship documentation, StreamBeat is the application
developed and maintained by Victor Flores, the developer account holder.
We have prepared a developer statement and supporting project evidence. We
will attach the personally reviewed and signed document.

Regarding third-party content under guideline 5.2.3, our prior technical
attachment describes directory-based discovery and direct playback. We
understand this is separate from documentary permissions for the broadcasts.
Could you clarify the additional documentary evidence you require for the
catalog/discovery service and for the individual radio streams? We are not
claiming that public stream URLs establish broadcaster authorization.

Thank you.

## Documentación de autoría

`output/pdf/StreamBeat-Developer-Relationship-DRAFT.pdf`: dos páginas,
declaración propuesta con firma vacía y apéndice de evidencia local.
No se ha firmado en nombre de Victor ni enviado a Apple. Los commits y bundle
apoyan la atribución; Apple puede requerir documentación adicional.

## Acciones del 1 de octubre, 10:54 AM (Panamá)

- Se envió una aclaración en App Store Connect. La conversación muestra
  `Messages (6)` y `Victor Flores — Today 10:54 AM`.
- Se informó que el build 23 permite compras/restauración sin cuenta y que
  la validación sandbox y la subida aún están pendientes.
- Se incluyeron los enlaces oficiales de Radio Browser (sitio, API y clientes)
  y se pidió distinguir entre documentación del directorio/API, emisiones
  concretas y relación desarrollador-app, indicando estaciones si aplica.
- No se afirmó que otras apps ni la licencia del catálogo acrediten derechos
  sobre las emisiones. Se pidió precisar el documento de autoría requerido.
- El intento de subida mediante `xcodebuild -exportArchive` falló con
  `Failed to Use Accounts`: Xcode requiere renovar la sesión Apple con acceso
  al equipo MTL4YJMX73. No se completó la subida ni el reenvío a revisión.
- El PDF permanece sin firma. No se ha sustituido la firma personal.

## Cambio de modelo solicitado después de la aclaración

El usuario sustituyó la propuesta anterior: no se subirá el build 23 ni se
ofrecerá suscripción mensual o Premium de por vida en el nuevo cliente.
El build 24 ofrece aportes voluntarios de US$0.99, US$2.99 y US$4.99.
Confirmó que aportar una vez quita la publicidad. Se usan tres productos
no consumibles, restaurables sin cuenta, vinculados a `remove_ads`.
La nube no forma parte del aporte. Se mantienen los derechos históricos
y las funciones de cancelación/portabilidad, sin vender planes antiguos.

La respuesta enviada a Apple a las 10:54 describe el candidato anterior.
Debe actualizarse al completar el nuevo build y catálogo; no equivale a
subida ni a reenvío del build 24.

## Evidencia del candidato 24 y catálogo en curso

- Build firmado 1.1.15 (24), IPA generado correctamente; pendiente de subida.
- 75 pruebas de monetización, traducciones y configuración aprobadas.
- Análisis de los archivos afectados: sin incidencias.
- Se ofrecen solamente los tres aportes; comprar/restaurar no exige cuenta.
- El catálogo Apple sigue en preparación: pequeño 6818231576 /
  `streambeat_support_small`, mediano 6818244649 /
  `streambeat_support_medium` (precio base US$2.99 y disponibilidad global
  guardados). El aporte grande todavía no se ha creado.
- RevenueCat: offering `support` creado; producto pequeño vinculado a
  `remove_ads`. Faltan productos mediano/grande y los tres packages.
- No se ha probado aún una transacción sandbox del candidato 24.
- Siguen pendientes metadatos/capturas de Apple, sustituir los artículos
  anteriores en revisión y verificar la política de restauración.
- La ficha pública Android acredita un vínculo adicional con Victor Flores,
  no permisos sobre emisoras: https://play.google.com/store/apps/details?id=com.victorflores.streambeat

/// Contrato comun para cualquier feature que quiera sincronizar su estado
/// con Firestore. La capa de sincronizacion no conoce el contenido; solo
/// orquesta cuando se debe empujar/jalar y le pasa el `uid` del usuario.
///
/// Para sumar una feature nueva al ciclo de sincronizacion basta con:
///   1. Crear su implementacion concreta de [Syncable].
///   2. Registrarla en `cloudSyncRegistryProvider`.
/// Ver `ARCHITECTURE.md > Sincronizacion en la nube` para el detalle.
abstract class Syncable {
  /// Identificador de la unidad sincronizada. Util para logs y telemetria.
  String get id;

  /// Empuja el estado local al backend del usuario [uid]. Debe ser
  /// idempotente: dos pushes consecutivos producen el mismo resultado.
  Future<void> pushToRemote(String uid);

  /// Trae el estado remoto del usuario [uid] y lo fusiona localmente. La
  /// estrategia de merge la decide cada feature (por ejemplo, favoritos hace
  /// union por videoId; ajustes prefiere lo remoto si trae timestamp mas
  /// nuevo).
  Future<void> pullFromRemote(String uid);
}

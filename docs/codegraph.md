# CodeGraph en StreamBeat

CodeGraph indexa el repositorio local para explorar símbolos, dependencias y
posibles pruebas afectadas. Es una herramienta de desarrollo; no forma parte
de la aplicación Flutter.

## Configuración

- `codegraph.json` incluye explícitamente los archivos generados `.g.dart` y
  `.freezed.dart` de `lib` para ayudar a resolver relaciones de Riverpod.
- `.codegraph/` contiene el índice local y está excluido de Git.
- CodeGraph respeta `.gitignore` para omitir dependencias, builds y archivos
  locales ignorados.
- En esta máquina, Codex ya tiene el servidor MCP global configurado con
  `CODEGRAPH_TELEMETRY=0`.

## Uso desde la raíz del proyecto

```sh
# Primera ejecución en otro checkout con CodeGraph instalado.
CODEGRAPH_TELEMETRY=0 codegraph init --yes

# Estado y actualización manual del índice.
CODEGRAPH_TELEMETRY=0 codegraph status
CODEGRAPH_TELEMETRY=0 codegraph sync

# Explorar el reproductor.
CODEGRAPH_TELEMETRY=0 codegraph explore AudioPlayerProvider BackgroundAudioHandler

# Buscar pruebas candidatas para un cambio.
CODEGRAPH_TELEMETRY=0 codegraph affected \
  lib/features/monetization/domain/entities/subscription_access.dart \
  --filter '**/*_test.dart' --json
```

En Codex, usar `codegraph_explore` con `projectPath` igual a la ruta absoluta
del checkout y `query` con nombres de símbolos o archivos relevantes.

El grafo es una ayuda para navegar, no una comprobación de corrección. Las
relaciones dinámicas, callbacks y referencias de Riverpod pueden ser incompletas
o ambiguas. Contrastar las relaciones y las pruebas sugeridas con el código;
que no aparezcan pruebas no significa que un cambio carezca de impacto.

Documentación: <https://github.com/colbymchenry/codegraph>.

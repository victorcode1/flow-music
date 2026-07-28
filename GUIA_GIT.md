# Guía rápida: llevar una función a `main` y `store`

Usa este flujo cuando una misma funcionalidad debe estar en las dos ramas, pero quieres probarla y revisarla antes de integrarla.

## 1. Crear la funcionalidad desde `main`

```bash
git switch main
git switch -c feature/nombre-funcion

# Haz el cambio y pruébalo.
git status
git add .
git commit -m "Add nombre funcion"
```

`git add .` añade todos los cambios del proyecto que aparezcan en `git status`. Revísalo antes de confirmar el commit para no incluir archivos que no correspondan a esta función.

## 2. Integrarla en `main`

```bash
git switch main
git merge feature/nombre-funcion
```

Prueba la aplicación otra vez en `main` cuando la integración termine.

## 3. Llevar el mismo cambio a `store`

Primero copia el identificador del commit que contiene la función:

```bash
git log --oneline -1 feature/nombre-funcion
```

Después aplícalo en `store`:

```bash
git switch store
git cherry-pick <hash-del-commit>
```

Así `store` recibe únicamente ese cambio, sin heredar todas las demás modificaciones que puedan existir en `main`.

## Si Git indica un conflicto

Resuelve los archivos marcados, pruébalos y continúa:

```bash
git status
git add <archivo-resuelto>
git cherry-pick --continue
```

Si decides no llevar ese cambio a `store`, cancela el proceso con:

```bash
git cherry-pick --abort
```

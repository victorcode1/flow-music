# Backup, public repo, and restore workflow

Este proyecto tiene dos destinos de GitHub con reglas diferentes.

## Remotos

- `origin`: `git@github.com:victorcode1/flow-music.git`
  - Repo personal privado.
  - Guarda la copia completa.
  - Puede tener archivos Firebase y `.env` solo en la rama privada.
- `organization`: `git@github.com:My-free-time/flow-music.git`
  - Repo publico de la organizacion.
  - Sirve para compartir, clonar, revisar y aceptar contribuciones.
  - Nunca debe recibir secretos.

## Ramas

- `1.0.0`: rama publica y sanitizada.
  - Esta rama se sube a `origin` y a `organization`.
  - No debe incluir `.env`, Firebase config real, llaves ni credenciales.
- `private/full-backup`: rama privada completa.
  - Esta rama se sube solo a `origin`.
  - Incluye archivos privados necesarios para restaurar el proyecto completo.

Regla principal: nunca subir `private/full-backup` a `organization`.

## Archivos privados

Estos archivos deben estar ignorados en la rama publica:

- `functions/.env.*`
- `.env`
- `.env.*`
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- `macos/Runner/GoogleService-Info.plist`
- `lib/firebase_options.dart`
- keystores, service accounts, API private keys, signing credentials

En el repo publico solo debe existir el ejemplo:

- `functions/.env.example`

## Trabajo normal

Para cambios normales de codigo, UI, docs, features o fixes, trabajar en:

```bash
cd /Users/victorflores/flow-music
git checkout 1.0.0
```

Luego hacer commit:

```bash
git add .
git commit -m "Describe el cambio"
```

Antes de publicar, verificar que no entren secretos:

```bash
git ls-files | grep -E 'google-services|GoogleService|firebase_options|\.env'
```

En la rama publica el resultado correcto es:

```bash
functions/.env.example
```

Subir cambios normales a los dos repos:

```bash
git push origin 1.0.0
git push organization 1.0.0
```

## Cambios privados

Usar este folder solo para respaldar archivos privados:

```bash
cd /Users/victorflores/flow-music-private-backup
git checkout private/full-backup
```

Agregar los archivos privados con `-f` porque `.gitignore` los bloquea por seguridad:

```bash
git add -f functions/.env.flowmusic-5715a
git add -f android/app/google-services.json
git add -f ios/Runner/GoogleService-Info.plist
git add -f macos/Runner/GoogleService-Info.plist
git add -f lib/firebase_options.dart
git commit -m "Update private config backup"
git push origin private/full-backup
```

Si SSH falla por timeout, usar HTTPS autenticado con GitHub CLI:

```bash
gh auth setup-git -h github.com
git push https://github.com/victorcode1/flow-music.git private/full-backup
```

No ejecutar esto nunca:

```bash
git push organization private/full-backup
```

## Nueva computadora

Para recuperar todo en una computadora nueva, clonar el repo privado:

```bash
git clone git@github.com:victorcode1/flow-music.git
cd flow-music
```

La rama principal del repo privado debe ser `private/full-backup`. Verificar:

```bash
git branch --show-current
```

Debe decir:

```bash
private/full-backup
```

Verificar que existan los archivos privados:

```bash
ls android/app/google-services.json
ls ios/Runner/GoogleService-Info.plist
ls macos/Runner/GoogleService-Info.plist
ls lib/firebase_options.dart
ls functions/.env.flowmusic-5715a
```

Instalar dependencias:

```bash
flutter pub get
cd functions
npm install
cd ..
```

Para iOS y macOS:

```bash
cd ios && pod install && cd ..
cd macos && pod install && cd ..
```

Conectar tambien el remoto publico de la organizacion:

```bash
git remote add organization git@github.com:My-free-time/flow-music.git
git fetch organization
```

Ejecutar el proyecto:

```bash
flutter doctor
flutter run
```

## Restaurar desde el repo publico

Si alguien clona el repo publico, no recibira secretos. Debe generar su propia configuracion:

```bash
npm install -g firebase-tools
dart pub global activate flutterfire_cli
firebase login
flutterfire configure
```

Crear el archivo de entorno desde el ejemplo:

```bash
cp functions/.env.example functions/.env.<firebase-project-id>
```

Luego editar ese `.env` con sus propios valores privados.

## Checklist rapido

Antes de subir al publico:

```bash
cd /Users/victorflores/flow-music
git checkout 1.0.0
git status --short
git ls-files | grep -E 'google-services|GoogleService|firebase_options|\.env'
```

Antes de subir el backup privado:

```bash
cd /Users/victorflores/flow-music-private-backup
git checkout private/full-backup
git status --short
```

Comandos correctos:

```bash
git push origin 1.0.0
git push organization 1.0.0
git push origin private/full-backup
```

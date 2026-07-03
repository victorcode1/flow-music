# Private backup files

This branch is private-only and must be pushed only to:

```bash
git@github.com:victorcode1/flow-music.git
```

It includes local configuration files that are intentionally excluded from the public branch:

- `functions/.env.flowmusic-5715a`
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- `macos/Runner/GoogleService-Info.plist`
- `lib/firebase_options.dart`

Do not push this branch to:

```bash
git@github.com:My-free-time/flow-music.git
```

To restore the complete local setup on another machine:

```bash
git clone git@github.com:victorcode1/flow-music.git
cd flow-music
git checkout private/full-backup
flutter pub get
cd functions && npm install && cd ..
```

For Apple platforms:

```bash
cd ios && pod install && cd ..
cd macos && pod install && cd ..
```

#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")/.."
build_number="${1:?Usage: bash tool/build_ios_release.sh BUILD_NUMBER}"
if [[ ! "$build_number" =~ ^[0-9]+$ ]]; then
  echo "BUILD_NUMBER must be numeric." >&2
  exit 1
fi

# Xcode Archive alone does not load the ignored Dart configuration file.
# Validate it and explicitly pass it to the Flutter archive/export command.
dart run tool/verify_monetization_config.dart --platform=ios
flutter build ipa --release \
  --build-number="$build_number" \
  --dart-define-from-file=config/monetization.local.json

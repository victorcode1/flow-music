#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUNDLE_DIR="${BUNDLE_DIR:-$ROOT_DIR/radio-bundles}"
RESTORE_DIR="${RESTORE_DIR:-$ROOT_DIR/radio-restored}"
MANIFEST_FILE="$BUNDLE_DIR/manifest.tsv"

if [[ ! -f "$MANIFEST_FILE" ]]; then
  echo "Missing manifest: $MANIFEST_FILE" >&2
  exit 1
fi

mkdir -p "$RESTORE_DIR"

restore_one() {
  local name="$1"
  local url="$2"
  local bundle="$3"
  local bundle_path="$BUNDLE_DIR/$bundle"
  local target="$RESTORE_DIR/$name"

  if [[ ! -f "$bundle_path" ]]; then
    echo "Missing bundle: $bundle_path" >&2
    return 1
  fi

  if [[ -e "$target" ]]; then
    echo "Skipping $name: $target already exists"
    return 0
  fi

  echo "Restoring $name"
  git clone "$bundle_path" "$target"
  git -C "$target" remote remove origin >/dev/null 2>&1 || true
  git -C "$target" remote add origin "$url"
}

if [[ "${1:-}" != "" ]]; then
  awk -F '\t' -v wanted="$1" 'NR > 1 && $1 == wanted { print $0 }' "$MANIFEST_FILE" |
    while IFS=$'\t' read -r name url bundle; do
      restore_one "$name" "$url" "$bundle"
    done
else
  awk -F '\t' 'NR > 1 { print $0 }' "$MANIFEST_FILE" |
    while IFS=$'\t' read -r name url bundle; do
      restore_one "$name" "$url" "$bundle"
    done
fi

#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RADIO_DIR="${RADIO_DIR:-$ROOT_DIR/radio}"
BUNDLE_DIR="${BUNDLE_DIR:-$ROOT_DIR/radio-bundles}"
MANIFEST_FILE="$BUNDLE_DIR/manifest.tsv"
PROJECTS_URL="${PROJECTS_URL:-https://gitlab.com/api/v4/groups/radiobrowser/projects?include_subgroups=true&per_page=100&order_by=name&sort=asc}"

require_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing required command: $1" >&2
    exit 1
  fi
}

require_command curl
require_command git
require_command jq

mkdir -p "$RADIO_DIR" "$BUNDLE_DIR"

projects="$(curl -fsSL "$PROJECTS_URL")"

{
  printf 'name\turl\tbundle\n'
  printf '%s\n' "$projects" |
    jq -r '.[] | [.path, .http_url_to_repo, (.path + ".bundle")] | @tsv'
} >"$MANIFEST_FILE.tmp"
mv "$MANIFEST_FILE.tmp" "$MANIFEST_FILE"

printf '%s\n' "$projects" |
  jq -r '.[] | [.path, .http_url_to_repo] | @tsv' |
  while IFS=$'\t' read -r name url; do
    repo_dir="$RADIO_DIR/$name"
    bundle_file="$BUNDLE_DIR/$name.bundle"
    tmp_bundle="$bundle_file.tmp"

    if [[ -d "$repo_dir/.git" ]]; then
      echo "Updating $name"
      git -C "$repo_dir" fetch --all --tags --prune
    elif [[ -e "$repo_dir" ]]; then
      echo "Skipping $name: $repo_dir exists but is not a git clone" >&2
      continue
    else
      echo "Cloning $name"
      git clone "$url" "$repo_dir"
    fi

    echo "Bundling $name"
    git -C "$repo_dir" bundle create "$tmp_bundle" --all
    mv "$tmp_bundle" "$bundle_file"
  done

echo "Radio Browser backups written to $BUNDLE_DIR"

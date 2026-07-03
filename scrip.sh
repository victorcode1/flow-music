#!/usr/bin/env bash

set -euo pipefail

DEFAULT_DEVICE_ID="00008130-000138E601E3803A"
FLOW_MUSIC_DIR="/Users/victorflores/flow-music"

create_temp_worktree() {
  local temp_dir

  if ! git -C "${FLOW_MUSIC_DIR}" show-ref --verify --quiet refs/heads/x; then
    echo "La rama x no existe localmente."
    exit 1
  fi

  temp_dir="$(mktemp -d "${TMPDIR:-/tmp}/flow-music-x.XXXXXX")"
  git -C "${FLOW_MUSIC_DIR}" worktree add --force "${temp_dir}" x >/dev/null
  printf '%s' "${temp_dir}"
}

cleanup_temp_worktree() {
  local temp_dir="${1:-}"

  if [[ -z "${temp_dir}" ]]; then
    return
  fi

  git -C "${FLOW_MUSIC_DIR}" worktree remove --force "${temp_dir}" >/dev/null 2>&1 || rm -rf "${temp_dir}"
}

read -r -p "Que version del proyecto quieres correr? 1) normal 2) x: " project_version

read_device_id() {
  local device_id
  read -r -p "ID del dispositivo [${DEFAULT_DEVICE_ID}]: " device_id

  if [[ -z "${device_id}" ]]; then
    device_id="${DEFAULT_DEVICE_ID}"
  fi

  printf '%s' "${device_id}"
}

case "${project_version}" in
  1)
    device_id="$(read_device_id)"
    cd "${FLOW_MUSIC_DIR}"
    flutter run -d "${device_id}"
    ;;
  2)
    temp_worktree_dir="$(create_temp_worktree)"
    trap 'cleanup_temp_worktree "${temp_worktree_dir}"' EXIT INT TERM

    cd "${temp_worktree_dir}"
    flutter run --release -d "${DEFAULT_DEVICE_ID}"
    ;;
  *)
    echo "Opcion invalida. Usa 1 o 2."
    exit 1
    ;;
esac
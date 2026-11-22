#!/usr/bin/env sh
set -eu

PROFILE="${1:-}"
CUR_DIR_PATH="$(cd "$(dirname "$0")" && pwd)"
NIX_CONFIG_DIR_PATH="${NIX_CONFIG_DIR_PATH:-/etc/nixos}"

if [ -n "$PROFILE" ]; then
  FLAKE_REF="${NIX_CONFIG_DIR_PATH}#${PROFILE}"
else
  FLAKE_REF="$NIX_CONFIG_DIR_PATH"
fi

sudo nixos-rebuild switch \
  --flake "$FLAKE_REF" \
  --option extra-experimental-features "nix-command flakes" \
  --override-input system-profiles "path:$CUR_DIR_PATH/.."

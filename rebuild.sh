#!/usr/bin/env sh
set -eu

# Rebuilds the system using the local checkout of this repo instead of the pinned/remote one
REPO_DIR_PATH="$(cd "$(dirname "$0")" && pwd)"
NIX_CONFIG_DIR_PATH="${NIX_CONFIG_DIR_PATH:-/etc/nixos}"

sudo nixos-rebuild switch \
  --flake "$NIX_CONFIG_DIR_PATH" \
  --override-input linux-setup "path:$REPO_DIR_PATH"

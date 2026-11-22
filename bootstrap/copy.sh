#!/usr/bin/env sh
set -eu

CUR_DIR_PATH="$(cd "$(dirname "$0")" && pwd)"
NIX_CONFIG_DIR_PATH="${NIX_CONFIG_DIR_PATH:-/etc/nixos}"

sudo cp -f "$CUR_DIR_PATH/flake.nix" "$NIX_CONFIG_DIR_PATH/flake.nix"

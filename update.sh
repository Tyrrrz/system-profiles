#!/usr/bin/env sh
set -eu

# Updates the lock file in this repo to the latest revisions of all inputs
cd "$(dirname "$0")"

nix flake update

# System Profiles

This is a collection of my Linux system profiles, powered by NixOS.

## Usage

- Clone or download this repository to anywhere on the system.
- Remove everything from your local `/etc/nixos/configuration.nix` except LUKS mappings, system state version, and any other machine-specific settings.
- Execute `bootstrap/copy.sh` to create a local flake at `/etc/nixos/flake.nix`.
- Execute `bootstrap/rebuild.sh <PROFILE>` to rebuild the system using the specified profile (e.g., `bootstrap/rebuild.sh nomad`).

> [!TIP]
> After the initial successful rebuild, you can execute `bootstrap/rebuild.sh` without any arguments to target the last activated profile.

> [!TIP]
> To rebuild the system using the local checkout of this repository instead of the remote one, execute `bootstrap/rebuild-override.sh <PROFILE>`.

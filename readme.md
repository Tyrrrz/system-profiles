# System Profiles

This is a collection of my Linux system profiles, powered by NixOS.

## Usage

- Clone or download this repository to anywhere on the system.
- Execute `bootstrap/copy.sh` to create a local flake at `/etc/nixos/flake.nix`.
- Execute `bootstrap/rebuild.sh <PROFILE>` to rebuild the system using the specified profile (e.g., `bootstrap/rebuild.sh nomad`).

This setup combines one of the provided system profiles with the local configuration in `/etc/nixos/configuration.nix`.
The latter can be used to store ephemeral machine-specific settings that don't need to be persisted in version control, such as hardware tweaks, LUKS mappings, temporary packages, etc.

> [!TIP]
> After the initial successful rebuild, you can execute `bootstrap/rebuild.sh` without any arguments to target the last activated profile.

> [!TIP]
> To rebuild the system using the local checkout of this repository instead of the remote one, execute `bootstrap/rebuild-override.sh <PROFILE>`.

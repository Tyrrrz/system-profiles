# System Profiles

This is a collection of my (Linux) system profiles, powered by NixOS.

## Usage

On the target machine, turn `/etc/nixos` into a flake with the following `flake.nix`:

```nix
{
  inputs = {
    # The profiles from this repository
    system-profiles.url = "github:Tyrrrz/system-profiles";

    # Reuse the same nixpkgs to keep everything consistent
    nixpkgs.follows = "system-profiles/nixpkgs";
  };

  outputs =
    { nixpkgs, system-profiles, ... }:
    {
      # The name must match the machine's hostname for `nixos-rebuild` to pick it up automatically
      nixosConfigurations.nomad = nixpkgs.lib.nixosSystem {
        modules = [
          # Specify the desired profile
          system-profiles.nixosModules.nomad

          # Machine-specific configuration
          ./hardware-configuration.nix
          ./configuration.nix
        ];
      };
    };
}
```

Any out-of-band configuration (LUKS devices, extra packages, etc.) goes into `configuration.nix` (or any other file imported by the flake):

```nix
{ pkgs, ... }:
{
  boot.initrd.luks.devices."luks-...".device = "/dev/disk/by-uuid/...";

  environment.systemPackages = with pkgs; [
    android-tools
  ];
}
```

## Updating

To update the profiles and packages on the target machine, run the following command:

```bash
sudo nix flake update --flake /etc/nixos
```

## Development

To test changes from a local checkout of this repository without pushing them, execute `./rebuild.sh`.
To update the dependencies of the local checkout, run `./update.sh`.

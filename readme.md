# Linux Setup

This is my current Linux setup, powered by NixOS.

## Usage

On the target machine, turn `/etc/nixos` into a flake with the following `flake.nix`:

```nix
{
  inputs = {
    # The profiles from this repository
    linux-setup.url = "github:Tyrrrz/linux-setup";

    # Reuse the same nixpkgs to keep everything consistent
    nixpkgs.follows = "linux-setup/nixpkgs";
  };

  outputs =
    { nixpkgs, linux-setup, ... }:

    {
      # The name must match the machine's hostname for `nixos-rebuild` to pick it up automatically
      nixosConfigurations.nomad = nixpkgs.lib.nixosSystem {
        modules = [
          # Specify the desired profile
          linux-setup.nixosModules.nomad

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

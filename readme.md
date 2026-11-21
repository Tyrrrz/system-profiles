# System Profiles

This is a collection of my Linux system profiles, powered by NixOS.

## Usage

On the target machine, turn `/etc/nixos` into a flake with the following `flake.nix`:

```nix
{
  inputs = {
    system-profiles.url = "github:Tyrrrz/system-profiles";
    nixpkgs.follows = "system-profiles/nixpkgs";
  };

  outputs =
    { nixpkgs, system-profiles, ... }:
    {
      # Name should match the profile
      nixosConfigurations.nomad = nixpkgs.lib.nixosSystem {
        modules = [
          # Desired profile
          system-profiles.nixosModules.nomad

          # Any additional machine-specific configuration
          ./hardware-configuration.nix
          ./configuration.nix
        ];
      };
    };
}
```

After that, you can rebuild the system with:

```bash
# Replace `nomad` with the name of the desired profile
sudo nixos-rebuild switch --flake /etc/nixos#nomad
```

## Development

- `./rebuild.sh` - rebuilds the system with the current local checkout of this repository.
- `./update.sh` - updates the dependencies of the local checkout.

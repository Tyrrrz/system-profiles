{
  description = "Tyrrrz's System Profiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { home-manager, nixpkgs-unstable, ... }:

    let
      mkProfile = path: {
        imports = [
          home-manager.nixosModules.home-manager
          path
        ];

        # Exposes packages from the unstable branch as `pkgs.unstable.<name>`
        nixpkgs.overlays = [
          (final: _: {
            unstable = import nixpkgs-unstable {
              system = final.stdenv.hostPlatform.system;
              config.allowUnfree = true;
            };
          })
        ];
      };
    in
    {
      nixosModules = {
        nomad = mkProfile ./profiles/nomad.nix;
      };
    };
}

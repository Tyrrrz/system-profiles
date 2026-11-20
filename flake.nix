{
  description = "Tyrrrz's System Profiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { home-manager, ... }:

    let
      mkProfile = path: {
        imports = [
          home-manager.nixosModules.home-manager
          path
        ];
      };
    in
    {
      nixosModules = {
        nomad = mkProfile ./profiles/nomad.nix;
      };
    };
}

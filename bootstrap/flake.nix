{
  inputs = {
    system-profiles.url = "github:Tyrrrz/system-profiles";
    nixpkgs.follows = "system-profiles/nixpkgs";
  };

  outputs =
    { nixpkgs, system-profiles, ... }:
    let
      mkSystem =
        module:
        nixpkgs.lib.nixosSystem {
          modules = [
            module
            ./configuration.nix
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.mapAttrs (_: module: mkSystem module) (
        builtins.removeAttrs system-profiles.nixosModules [ "default" ]
      );
    };
}

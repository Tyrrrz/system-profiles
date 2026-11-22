{
  inputs = {
    system-profiles.url = "github:Tyrrrz/system-profiles";
    nixpkgs.follows = "system-profiles/nixpkgs";
  };

  outputs =
    { nixpkgs, system-profiles, ... }:
    let
      mkSystem =
        profile:
        nixpkgs.lib.nixosSystem {
          modules = [
            system-profiles.nixosModules.${profile}
            ./configuration.nix
          ];
        };
    in
    {
      nixosConfigurations.nomad = mkSystem "nomad";
    };
}

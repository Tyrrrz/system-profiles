{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-26.05";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Umbriel uses its own nixpkgs snapshot
    umbriel = {
      url = "github:noctalia-dev/umbriel/cachix";
    };

    # Noctalia suite uses its own nixpkgs snapshot
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "noctalia/nixpkgs";
    };

    luciole = {
      url = "github:noctalia-dev/luciole";
      inputs.nixpkgs.follows = "noctalia/nixpkgs";
    };
  };

  outputs =
    {
      home-manager,
      umbriel,
      noctalia,
      noctalia-greeter,
      luciole,
      ...
    }:
    let
      mkProfile = path: {
        imports = [
          home-manager.nixosModules.home-manager
          umbriel.nixosModules.default
          noctalia-greeter.nixosModules.default
          luciole.nixosModules.default
          path
        ];

        home-manager.sharedModules = [
          umbriel.homeModules.default
          noctalia.homeModules.default
          luciole.homeModules.default
        ];
      };
    in
    {
      nixosModules = {
        nomad = mkProfile ./profiles/nomad.nix;
      };
    };
}

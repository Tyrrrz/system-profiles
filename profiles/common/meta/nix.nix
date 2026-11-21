{ pkgs, ... }:
{
  system.stateVersion = "26.05";

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    # Flakes invalidate channels
    channel.enable = false;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  documentation.nixos.enable = false;

  environment.systemPackages = with pkgs; [
    nixfmt
  ];
}

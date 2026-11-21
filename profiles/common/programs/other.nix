{ config, pkgs, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    home.packages = with pkgs; [
      evolution
      fastfetch
      fragments
      gh
      google-chrome
      libreoffice
      mission-center
      p7zip
      proton-vpn
      tree
      vlc
    ];
  };
}

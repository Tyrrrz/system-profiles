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
      micro
      mission-center
      p7zip
      proton-vpn
      ripgrep
      vlc
    ];
  };
}

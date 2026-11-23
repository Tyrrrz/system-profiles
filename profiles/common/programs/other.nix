{ config, pkgs, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    home.packages = with pkgs; [
      evolution
      fragments
      google-chrome
      libreoffice
      micro
      mission-center
      proton-vpn
      vlc
    ];

    programs = {
      fastfetch.enable = true;
      gh.enable = true;
      opencode.enable = true;
      ripgrep.enable = true;
    };
  };
}

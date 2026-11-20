{ config, pkgs, ... }:

{
  config = {
    home-manager.users.${config.profile.primaryUserName} = {
      home.packages = with pkgs; [
        fastfetch
        transmission_4-gtk
        gh
        google-chrome
        libreoffice
        p7zip
        proton-vpn
        tree
      ];
    };
  };
}

{ config, pkgs, ... }:

{
  config = {
    home-manager.users.${config.profile.primaryUserName} = {
      home.packages = with pkgs; [
        sound-theme-freedesktop
      ];
    };
  };
}

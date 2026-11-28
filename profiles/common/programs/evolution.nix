{ config, pkgs, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    home.packages = with pkgs; [
      evolution
    ];

    dconf.settings = {
      "org/gnome/evolution/mail" = {
        layout = 1;
      };
    };
  };
}

{ config, pkgs, ... }:

{
  config = {
    home-manager.users.${config.profile.primaryUserName} = {
      gtk = {
        enable = true;

        iconTheme = {
          name = "Numix-Circle";
          package = pkgs.numix-icon-theme-circle;
        };
      };
    };
  };
}

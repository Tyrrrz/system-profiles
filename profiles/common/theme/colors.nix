{ config, pkgs, ... }:

{
  config = {
    home-manager.users.${config.profile.primaryUserName} = {
      home.packages = with pkgs; [
        kdePackages.qt6ct
        libsForQt5.qt5ct
      ];

      gtk = {
        enable = true;

        # Noctalia needs adw-gtk3 to override GTK3 colors
        gtk3.theme = {
          name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
        };

        # Noctalia provides its own GTK4 theme
        gtk4.theme = null;
      };

      qt = {
        enable = true;

        # Noctalia needs qt6ct to override Qt5/6 colors
        platformTheme.name = "qtct";
      };
    };
  };
}

{ config, pkgs, ... }:

let
  extensions = with pkgs.gnomeExtensions; [
    alphabetical-app-grid
    appindicator
    blur-my-shell
    gsconnect
    tophat
  ];
in
{
  config = {
    # Enable KDE Connect integration so that GSConnect can work
    programs.kdeconnect = {
      enable = true;
      # The package will be installed at user level (GSConnect)
      package = null;
    };

    home-manager.users.${config.profile.primaryUserName} = {
      home.packages = extensions;

      dconf.settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = map (ext: ext.extensionUuid) extensions;
        };

        "org/gnome/shell/extensions/tophat" = {
          position-in-panel = "left";
        };
      };
    };
  };
}

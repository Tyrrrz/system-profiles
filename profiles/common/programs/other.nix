{ config, pkgs, ... }:
{
  programs = {
    kdeconnect.enable = true;
    steam.enable = true;
  };

  home-manager.users.${config.profile.primaryUserName} = {
    home.packages = with pkgs; [
      fragments
      google-chrome
      libreoffice
      micro
      proton-vpn
      vlc
      xh
    ];

    programs = {
      btop.enable = true;
      fastfetch.enable = true;
      gh.enable = true;
      jq.enable = true;
      opencode.enable = true;
      ripgrep.enable = true;
    };

    dconf.settings = {
      "org/gtk/settings/file-chooser" = {
        show-hidden = true;
        sort-directories-first = true;
      };
      "org/gtk/gtk4/settings/file-chooser" = {
        show-hidden = true;
        sort-directories-first = true;
      };
    };
  };
}

{ config, pkgs, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    home.packages = with pkgs; [
      # Sound theme for terminal bell
      sound-theme-freedesktop
      # Sound player for terminal bell
      libcanberra-gtk3
    ];

    programs.foot = {
      enable = true;

      settings = {
        main = {
          font = "monospace:size=12";
          pad = "12x12 center";
        };

        bell = {
          urgent = "yes";
          notify = "yes";
          command = "${pkgs.libcanberra-gtk3}/bin/canberra-gtk-play -f ${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/bell.oga";
          command-focused = "yes";
        };
      };
    };
  };
}

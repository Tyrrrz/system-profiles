{
  config,
  lib,
  pkgs,
  ...
}:
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
          command = "${lib.getExe' pkgs.libcanberra-gtk3 "canberra-gtk-play"} --id=bell";
          command-focused = "yes";
        };
      };
    };

    xdg.terminal-exec = {
      enable = true;

      settings = {
        default = [
          "foot.desktop"
        ];
      };
    };
  };
}

{ config, pkgs, ... }:
{
  config = {
    home-manager.users.${config.profile.primaryUserName} = {
      home.packages = with pkgs; [
        # Sound theme
        sound-theme-freedesktop
      ];

      programs.ghostty = {
        enable = true;

        settings = {
          bell-features = "audio,system,attention,title";
          bell-audio-path = "${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/bell.oga";
          bell-audio-volume = 1.0;

          window-padding-x = 12;
          window-padding-y = 12;
        };
      };
    };
  };
}

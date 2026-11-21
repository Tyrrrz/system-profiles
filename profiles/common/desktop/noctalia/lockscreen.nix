{ config, pkgs, ... }:
{
  config = {
    home-manager.users.${config.profile.primaryUserName} = {
      programs.noctalia.settings = {
        lockscreen = {
          transition = [ "zoom" ];
          transition_duration = 200;
        };

        lockscreen_widgets = {
          enabled = true;

          widget."lockscreen-clock@eDP-1" = {
            type = "clock";
            output = "eDP-1";
            box_width = 480.0;
            box_height = 120.0;
            cx = 960.0;
            cy = 320.0;
            placement_width = 1920.0;
            placement_height = 1080.0;
            rotation = 0.0;

            settings = {
              background = false;
            };
          };

          widget."lockscreen-login-box@eDP-1" = {
            type = "login_box";
            output = "eDP-1";
            box_width = 810.0;
            box_height = 196.0;
            cx = 960.0;
            cy = 898.0;
            placement_width = 1920.0;
            placement_height = 1080.0;
            rotation = 0.0;

            settings = {
              layout = "compact";
              show_unlock_hint = false;
              background_opacity = 0.0;
            };
          };

          idle.behavior = {
            lock = {
              enabled = true;
              timeout = 180;
              action = "lock";
            };

            "screen-off" = {
              enabled = true;
              timeout = 190;
              locked_timeout = 10;
              action = "screen_off";
            };
          };

          # Sync Noctalia appearance to Noctalia Greeter
          shell.greeter_sync.auto_sync = true;
        };
      };
    };
  };
}

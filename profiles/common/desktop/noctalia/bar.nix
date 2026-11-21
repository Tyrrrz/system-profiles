{ config, pkgs, ... }:
{
  config = {
    home-manager.users.${config.profile.primaryUserName} = {
      programs.noctalia.settings = {
        bar.default = {
          margin_ends = "1%";
          capsule = true;

          start = [
            "launcher"
            "workspaces"
            "cpu"
            "ram"
            "network_rx"
            "media"
          ];

          center = [
            "clock"
          ];

          end = [
            "tray"
            "notifications"
            "keyboard_layout"
            "clipboard"
            "bluetooth"
            "network"
            "volume"
            "brightness"
            "battery"
            "session"
          ];
        };

        widget = {
          battery = {
            show_label = true;
          };

          bluetooth = {
            show_label = false;
          };

          brightness = {
            show_label = false;
          };

          clock = {
            capsule = false;
            font_weight = 800;
          };

          media = {
            hide_when_no_media = true;
            hide_when_idle = false;
          };

          network = {
            show_label = false;
          };

          tray = {
            drawer = true;
          };

          volume = {
            show_label = false;
          };
        };

        control_center = {
          show_session_button = false;
        };

        calendar = {
          enabled = true;
        };

        notification = {
          enable_daemon = true;
          position = "top_center";
        };
      };
    };
  };
}

{ config, pkgs, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    programs.noctalia.settings = {
      bar.default = {
        margin_ends = 48;
        widget_spacing = 8;
        capsule = true;

        capsule_group = [
          {
            id = "sysmon";
            members = [
              "cpu"
              "ram"
              "network_rx"
              "network_tx"
            ];
          }
          {
            id = "hardware";
            members = [
              "bluetooth"
              "network"
              "volume"
              "brightness"
            ];
          }
        ];

        start = [
          "launcher"
          "workspaces"
          "taskbar"
          "group:sysmon"
          "audio_visualizer"
        ];

        center = [
          "clock"
        ];

        end = [
          "keyboard_layout"
          "tray"
          "notifications"
          "clipboard"
          "group:hardware"
          "battery"
          "session"
        ];
      };

      widget = {
        audio_visualizer = {
          mirrored = false;
          centered = false;

          actions = {
            left = "panel-toggle control-center media";
          };
        };

        battery = {
          display_mode = "graphic";
          hide_when_plugged = false;
          hide_when_full = true;
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

        cpu = {
          show_value = false;
        };

        media = {
          hide_when_no_media = true;
          hide_when_idle = false;
        };

        network = {
          show_label = false;
        };

        network_rx = {
          show_value = false;
        };

        network_tx = {
          show_value = false;
        };

        ram = {
          show_value = false;
        };

        taskbar = {
          only_active_workspace = true;
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

      notification = {
        enable_daemon = true;
        position = "top_center";
      };
    };
  };
}

{ config, pkgs, ... }:

{
  config = {
    nix.settings = {
      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };

    # Use GNOME Keyring for managing secrets
    services.gnome.gnome-keyring.enable = true;

    home-manager.users.${config.profile.primaryUserName} = {
      programs.noctalia = {
        enable = true;

        settings = {
          theme = {
            mode = "dark";
            source = "community";
            community_palette = "Tomorrow";

            templates = {
              enable_builtin_templates = true;
              builtin_ids = [
                "ghostty"
                "gtk3"
                "gtk4"
                "kcolorscheme"
                "luciole"
                "qt"
                "umbriel"
              ];
            };
          };

          wallpaper = {
            default.path = "${../assets/wallpaper.jpg}";

            transition = [ "fade" ];
            transition_duration = 200;
          };

          audio = {
            enable_sounds = true;
            sound_theme = "freedesktop";
          };

          bluetooth = {
            connect_when_enabled = true;
            connection_notifications = true;
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
          };

          # Sync Noctalia appearance to Noctalia Greeter
          shell.greeter_sync.auto_sync = true;

          location = {
            auto_locate = true;
          };

          nightlight.enabled = true;

          # Top bar, widgets and panels
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

          calendar.enabled = true;

          control_center = {
            show_session_button = false;
          };

          notification = {
            enable_daemon = true;
            position = "top_center";
          };

          shell = {
            polkit_agent = true;

            # Round screen corners
            screen_corners = {
              enabled = true;
            };

            # Track app usage
            screen_time_enabled = true;

            # Show external IP in the network widget
            external_ip_enabled = true;

            launcher = {
              categories = false;
              compact = true;
              layout = "simple";
            };

            panel = {
              launcher_placement = "attached";
              launcher_position = "auto";
              open_near_click_launcher = true;

              clipboard_placement = "attached";
              clipboard_position = "auto";
              open_near_click_clipboard = true;

              control_center_placement = "attached";
              control_center_position = "auto";
              open_near_click_control_center = true;

              wallpaper_placement = "attached";
              wallpaper_position = "auto";
              open_near_click_wallpaper = true;

              session_placement = "attached";
              session_position = "auto";
              open_near_click_session = true;

              polkit_placement = "attached";
              polkit_position = "auto";
            };

            session = {
              actions = [
                {
                  action = "lock";
                  variant = "secondary";
                }
                {
                  action = "lock_and_suspend";
                  variant = "secondary";
                }
                {
                  action = "logout";
                  variant = "primary";
                }
                {
                  action = "reboot";
                  variant = "destructive";
                }
                {
                  action = "shutdown";
                  variant = "destructive";
                }
              ];
            };

            window_switcher = {
              current_workspace_only = true;
              style = "compact";
            };

            screenshot = {
              confirm_region = true;
            };
          };
        };
      };
    };
  };
}

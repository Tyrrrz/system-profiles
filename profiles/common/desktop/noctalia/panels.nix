{ config, pkgs, ... }:

{
  config = {
    home-manager.users.${config.profile.primaryUserName} = {
      programs.noctalia.settings = {
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

        shell = {
          launcher = {
            categories = false;
            compact = true;
            layout = "simple";
          };

          window_switcher = {
            current_workspace_only = true;
            style = "compact";
          };

          screenshot = {
            confirm_region = true;
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
        };
      };
    };
  };
}

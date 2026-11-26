{ config, ... }:
{
  # Install Umbriel, register its session, and set up the screen sharing portal
  programs.umbriel.enable = true;

  home-manager.users.${config.profile.primaryUserName} =
    { config, ... }:
    {
      programs.umbriel = {
        enable = true;

        settings = {
          general = {
            autostart = [ "noctalia" ];
            show_cheatsheet = false;
          };

          input = {
            keyboard = {
              layout = "us,ua";
              variant = ",winkeysenhanced";
              options = "grp:alts_toggle";
              track_layout = "window";
            };

            touchpad = {
              disable_while_typing = false;
              natural_scroll = true;
              tap = true;
            };

            mouse = {
              accel_profile = "flat";
            };

            middle_click_paste = false;
          };

          layout = {
            mode = "scrolling";
          };
        };
      };
    };
}

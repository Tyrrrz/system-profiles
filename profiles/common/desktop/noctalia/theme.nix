{ config, pkgs, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    home.packages = with pkgs; [
      # Sound theme
      sound-theme-freedesktop
    ];

    programs.noctalia.settings = {
      theme = {
        mode = "dark";
        source = "community";
        community_palette = "Tomorrow";

        # Templates automatically re-style supported applications
        # or UI libraries to match Noctalia's current theme.
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
        default.path = "${../../assets/wallpaper.jpg}";

        transition = [ "fade" ];
        transition_duration = 200;
      };

      audio = {
        enable_sounds = true;
        sound_theme = "freedesktop";
      };

      shell = {
        screen_corners = {
          enabled = true;
        };
      };
    };

    # Noctalia's templates require a bit of manual plumbing to work with GTK applications
    gtk = {
      enable = true;

      gtk3.theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };

      gtk4.theme = null;
    };

    # Noctalia's templates require a bit of manual plumbing to work with QT applications
    qt = {
      enable = true;
      platformTheme.name = "qtct";
    };
  };
}

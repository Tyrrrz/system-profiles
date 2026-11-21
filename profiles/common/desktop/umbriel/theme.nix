{ config, ... }:
{
  home-manager.users.${config.profile.primaryUserName} =
    { config, ... }:
    {
      programs.umbriel.settings = {
        appearance = {
          title_bar = {
            # Show the title bar (and window buttons) on windows that don't provide their own
            mode = "negotiated";

            buttons = [
              "minimize"
              "maximize"
              "close"
            ];

            # Try to match the visual style to GTK4 title bars
            height = 46;
            font = "sans-serif";
            title_align = "center";
            button_glyph = "always";
            button_background = false;
          };
        };

        colors = {
          # Try to match the visual style to GTK4 title bars
          title_bar = {
            close_glyph = "#FFFFFFFF";
            close_glyph_hover = "#FFFFFFFF";
            maximize_glyph = "#FFFFFFFF";
            maximize_glyph_hover = "#FFFFFFFF";
            minimize_glyph = "#FFFFFFFF";
            minimize_glyph_hover = "#FFFFFFFF";
          };
        };

        input = {
          cursor = {
            theme = config.home.pointerCursor.name;
            size = config.home.pointerCursor.size;
          };
        };
      };
    };
}

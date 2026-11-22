{ config, ... }:
{
  home-manager.users.${config.profile.primaryUserName} =
    { config, ... }:
    {
      programs.umbriel.settings = {
        input = {
          cursor = {
            theme = config.home.pointerCursor.name;
            size = config.home.pointerCursor.size;
          };
        };
      };
    };
}

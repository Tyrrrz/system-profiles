{ config, ... }:
{
  services.displayManager.noctalia-greeter = {
    enable = true;

    settings = {
      appearance = {
        hide_logo = true;
        power_buttons_position = "top-right";
        scheme_selector_position = "hidden";
      };

      # Match the cursor of the desktop session
      cursor = {
        theme = config.home-manager.users.${config.profile.primaryUserName}.home.pointerCursor.name;
        size = config.home-manager.users.${config.profile.primaryUserName}.home.pointerCursor.size;
        path = config.home-manager.users.${config.profile.primaryUserName}.home.pointerCursor.package;
      };

      output.scale = 1.0;
    };
  };

  # Unlock the keyring automatically when logging in through the greeter
  security.pam.services.greetd.enableGnomeKeyring = true;
}

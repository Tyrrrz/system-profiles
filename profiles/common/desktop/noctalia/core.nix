{ config, pkgs, ... }:
{
  config = {
    # Use GNOME Keyring for managing secrets
    services.gnome.gnome-keyring.enable = true;

    home-manager.users.${config.profile.primaryUserName} = {
      programs.noctalia = {
        enable = true;

        settings = {
          bluetooth = {
            connect_when_enabled = true;
            connection_notifications = true;
          };

          location = {
            auto_locate = true;
          };

          nightlight = {
            enabled = true;
          };

          shell = {
            polkit_agent = true;

            # Track app usage
            screen_time_enabled = true;

            # Show external IP in the network widget
            external_ip_enabled = true;
          };
        };
      };
    };
  };
}

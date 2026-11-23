{ config, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    # Replacement for `cat`
    programs.bat = {
      enable = true;
    };

    home.shellAliases = {
      cat = "bat";
    };
  };
}

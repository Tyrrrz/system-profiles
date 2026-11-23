{ config, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    # Replacement for `ls`
    programs.eza = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;

      colors = "auto";
      icons = "auto";
      git = true;
    };

    home.shellAliases.tree = "eza --tree";

    # Replacement for `cat`
    programs.bat = {
      enable = true;
    };

    home.shellAliases.cat = "bat";
  };
}

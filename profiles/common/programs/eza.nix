{ config, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    # Replacement for `ls`
    programs.eza = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;

      colors = "auto";
      icons = "auto";
      git = true;
    };

    home.shellAliases = {
      # Aliases for `ls` are already provided
      tree = "eza --tree";
    };
  };
}

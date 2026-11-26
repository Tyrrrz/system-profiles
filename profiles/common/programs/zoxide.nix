{ config, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    # Replacement for `cd`
    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;

      options = [
        "--cmd cd"
      ];
    };
  };
}

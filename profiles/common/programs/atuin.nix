{ config, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    # Replacement for history search
    programs.atuin = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;

      flags = [
        # Only use with Ctrl+R
        "--disable-up-arrow"
      ];
    };
  };
}

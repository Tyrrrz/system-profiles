{ config, lib, ... }:
{
  users.users.${config.profile.primaryUserName} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.${config.profile.primaryUserName} = {
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}

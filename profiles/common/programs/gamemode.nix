{ config, ... }:
{
  programs.gamemode.enable = true;

  users.users.${config.profile.primaryUserName} = {
    extraGroups = [ "gamemode" ];
  };
}

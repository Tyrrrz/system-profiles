{ config, lib, ... }:
{
  users.users.${config.profile.primaryUserName} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}

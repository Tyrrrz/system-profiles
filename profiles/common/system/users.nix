{ config, lib, ... }:
{
  options = {
    profile.primaryUserName = lib.mkOption {
      type = lib.types.str;
      description = "Name of the primary user account.";
    };
  };

  config = {
    users.users.${config.profile.primaryUserName} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
}

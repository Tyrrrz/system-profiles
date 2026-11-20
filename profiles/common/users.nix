{ config, lib, ... }:

{
  options = {
    profile.primaryUserName = lib.mkOption {
      type = lib.types.str;
      description = "Name of the user account, on a single-user system.";
    };
  };

  config = {
    users.users.${config.profile.primaryUserName} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
}

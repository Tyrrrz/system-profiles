{ lib, ... }:
{
  imports = [
    ./desktop
    ./meta
    ./programs
    ./system
    ./theme
  ];

  options = {
    profile = {
      name = lib.mkOption {
        type = lib.types.str;
        description = "Name of the profile.";
      };

      primaryUserName = lib.mkOption {
        type = lib.types.str;
        description = "Name of the primary user account.";
      };
    };
  };
}

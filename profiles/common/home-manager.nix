{ config, ... }:

{
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      backupFileExtension = "backup";
      overwriteBackup = true;

      users.${config.profile.primaryUserName} = {
        home = {
          stateVersion = config.system.stateVersion;
        };
      };
    };
  };
}

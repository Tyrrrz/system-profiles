{ config, ... }:
{
  config = {
    programs.virt-manager.enable = true;

    home-manager.users.${config.profile.primaryUserName} = {
      dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = [ "qemu:///system" ];
          uris = [ "qemu:///system" ];
        };
      };
    };
  };
}

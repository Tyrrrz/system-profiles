{ config, pkgs, ... }:
{
  config = {
    virtualisation = {
      containers.enable = true;

      docker = {
        enable = true;
        autoPrune.enable = true;
      };

      libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu;
          swtpm.enable = true;
        };
      };

      spiceUSBRedirection.enable = true;
    };

    users.users.${config.profile.primaryUserName} = {
      extraGroups = [
        "docker"
        "libvirtd"
        "kvm"
      ];
    };
  };
}

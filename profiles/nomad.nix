{ ... }:

{
  imports = [
    ./common/gnome
    ./common/audio.nix
    ./common/bash.nix
    ./common/bluetooth.nix
    ./common/boot.nix
    ./common/firmware.nix
    ./common/gaming.nix
    ./common/git.nix
    ./common/home-manager.nix
    ./common/locale.nix
    ./common/network.nix
    ./common/nix.nix
    ./common/power.nix
    ./common/software.nix
    ./common/users.nix
    ./common/virtualization.nix
    ./common/vscode.nix
    ./common/yubikey.nix
  ];

  config = {
    networking.hostName = "nomad";
    profile.primaryUserName = "tyrrrz";
  };
}

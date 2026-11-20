{ config, pkgs, ... }:

{
  config = {
    home-manager.users.${config.profile.primaryUserName} = {
      home.packages = with pkgs; [
        fastfetch
        # The stable version is buggy, so use the one from unstable.
        # TODO: Switch back to the stable version once we move to 26.11.
        unstable.fragments
        gh
        google-chrome
        libreoffice
        p7zip
        proton-vpn
        tree
      ];
    };
  };
}

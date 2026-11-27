{ config, ... }:
{
  # Keep IP addresses tied to their own interfaces on multi-interface hosts.
  # This allows connecting to the same network with both Ethernet and Wi-Fi
  # at the same time, without the risk of interference.
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.arp_ignore" = 1;
    "net.ipv4.conf.default.arp_ignore" = 1;
    "net.ipv4.conf.all.arp_announce" = 2;
    "net.ipv4.conf.default.arp_announce" = 2;
    "net.ipv4.conf.all.rp_filter" = 2;
    "net.ipv4.conf.default.rp_filter" = 2;
  };

  networking = {
    hostName = config.profile.name;

    networkmanager = {
      enable = true;

      insertNameservers = [
        # https://one.one.one.one/dns
        "1.1.1.1"
        "1.0.0.1"
        "2606:4700:4700::1111"
        "2606:4700:4700::1001"
      ];
    };

    firewall.enable = true;
  };

  users.users.${config.profile.primaryUserName} = {
    extraGroups = [ "networkmanager" ];
  };
}

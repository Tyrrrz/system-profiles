{ ... }:

{
  imports = [
    ./common/desktop
    ./common/meta
    ./common/programs
    ./common/system
    ./common/theme
  ];

  config = {
    networking.hostName = "nomad";
    profile.primaryUserName = "tyrrrz";
  };
}

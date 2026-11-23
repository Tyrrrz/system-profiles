{ config, ... }:
{
  home-manager.users.${config.profile.primaryUserName} = {
    programs.bash = {
      enable = true;

      # Enable the bell sound
      bashrcExtra = ''
        bind 'set bell-style audible'
      '';
    };
  };
}

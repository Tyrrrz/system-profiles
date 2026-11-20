{ config, ... }:

{
  config = {
    home-manager.users.${config.profile.primaryUserName} = {
      programs.git = {
        enable = true;

        settings = {
          user = {
            name = config.profile.primaryUserName;
            email = "1935960+${config.profile.primaryUserName}@users.noreply.github.com";
          };

          init.defaultBranch = "prime";
          pull.rebase = true;
        };
      };
    };
  };
}

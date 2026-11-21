{ config, ... }:

{
  config = {
    home-manager.users.${config.profile.primaryUserName} = {
      programs.git = {
        enable = true;

        settings = {
          user = {
            name = "tyrrrz";
            email = "1935960+tyrrrz@users.noreply.github.com";
          };

          init.defaultBranch = "prime";
          pull.rebase = true;
        };
      };
    };
  };
}

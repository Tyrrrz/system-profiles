{ config, pkgs, ... }:
{
  config = {
    # Support for Trash and remote folders
    services.gvfs.enable = true;

    home-manager.users.${config.profile.primaryUserName} =
      { config, ... }:
      {
        programs.luciole = {
          enable = true;

          settings = {
            browser = {
              view_mode = "list";
              show_hidden = true;
              show_permanent_deletion = true;
            };
          };
        };

        # Script: Open in VS Code
        xdg.dataFile."luciole/scripts/Open in VS Code" = {
          executable = true;
          text = ''
            #!${pkgs.runtimeShell}
            if [ "$#" -gt 0 ]; then
                exec ${pkgs.vscode}/bin/code "$@"
            else
                exec ${pkgs.vscode}/bin/code "$PWD"
            fi
          '';
        };

        gtk = {
          enable = true;

          gtk3 = {
            # Define custom sidebar bookmarks for all file managers and pickers
            bookmarks = [
              "file:///etc/nixos NixOS Config"
              "file://${config.home.homeDirectory}/Documents"
              "file://${config.home.homeDirectory}/Downloads"
              "file://${config.home.homeDirectory}/Music"
              "file://${config.home.homeDirectory}/Pictures"
              "file://${config.home.homeDirectory}/Projects"
              "file://${config.home.homeDirectory}/Videos"
            ];
          };
        };
      };
  };
}

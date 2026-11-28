{
  config,
  lib,
  pkgs,
  ...
}:
{
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
              exec ${lib.getExe config.programs.vscode.package} "$@"
          else
              exec ${lib.getExe config.programs.vscode.package} "$PWD"
          fi
        '';
      };

      gtk = {
        enable = true;

        gtk3 = {
          # Define custom sidebar bookmarks for all file managers and pickers
          bookmarks = [
            "file:///etc/nixos NixOS Config"
          ]
          # Preserve default XDG bookmarks
          ++ lib.mapAttrsToList (_: dir: "file://${dir} ${builtins.baseNameOf dir}") (
            (lib.filterAttrs (_: dir: lib.isString dir) config.xdg.userDirs) // config.xdg.userDirs.extraConfig
          );
        };
      };
    };
}

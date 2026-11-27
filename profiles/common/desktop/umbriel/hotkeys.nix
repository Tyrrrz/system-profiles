{ config, ... }:
{
  home-manager.users.${config.profile.primaryUserName} =
    { config, ... }:
    {
      programs.umbriel.settings = {
        keybinds = {
          # Terminal
          "Mod+Return" = {
            action = "spawn xdg-terminal";
            repeat = false;
          };

          # File manager
          "Mod+E" = {
            action = "spawn xdg-open ~";
            repeat = false;
          };

          # AI assistant
          "Super+Shift+F23" = {
            action = "spawn opencode";
            repeat = false;
          };

          # Noctalia actions
          "Mod" = {
            action = "spawn noctalia msg panel-toggle launcher";
            repeat = false;
          };
          "Mod+L" = {
            action = "spawn noctalia msg session lock";
            repeat = false;
          };
          "Print" = {
            action = "spawn noctalia msg screenshot-region";
            repeat = false;
          };
          "Shift+Print" = {
            action = "spawn noctalia msg screenshot-window";
            repeat = false;
          };
          "Mod+Print" = {
            action = "spawn noctalia msg screenshot-annotate";
            repeat = false;
          };
          "Alt+Tab" = {
            action = "spawn noctalia msg window-switcher hold";
          };
          "Alt+Shift+Tab" = {
            action = "spawn noctalia msg window-switcher hold reverse";
          };

          # Route media buttons through Noctalia so that its OSDs are shown
          "XF86AudioRaiseVolume" = {
            action = "spawn noctalia msg volume-up";
            allow_when_locked = true;
          };
          "XF86AudioLowerVolume" = {
            action = "spawn noctalia msg volume-down";
            allow_when_locked = true;
          };
          "XF86AudioMute" = {
            action = "spawn noctalia msg volume-mute";
            allow_when_locked = true;
            repeat = false;
          };
          "XF86AudioMicMute" = {
            action = "spawn noctalia msg mic-mute";
            allow_when_locked = true;
            repeat = false;
          };
          "XF86AudioPlay" = {
            action = "spawn noctalia msg media toggle";
            allow_when_locked = true;
            repeat = false;
          };
          "XF86AudioNext" = {
            action = "spawn noctalia msg media next";
            allow_when_locked = true;
          };
          "XF86AudioPrev" = {
            action = "spawn noctalia msg media previous";
            allow_when_locked = true;
          };
          "XF86MonBrightnessUp" = {
            action = "spawn noctalia msg brightness-up";
            allow_when_locked = true;
          };
          "XF86MonBrightnessDown" = {
            action = "spawn noctalia msg brightness-down";
            allow_when_locked = true;
          };

          # Workspaces
          "Mod+1" = {
            action = "workspace-switch 1";
            repeat = false;
          };
          "Mod+2" = {
            action = "workspace-switch 2";
            repeat = false;
          };
          "Mod+3" = {
            action = "workspace-switch 3";
            repeat = false;
          };
          "Mod+4" = {
            action = "workspace-switch 4";
            repeat = false;
          };
          "Mod+5" = {
            action = "workspace-switch 5";
            repeat = false;
          };
          "Mod+6" = {
            action = "workspace-switch 6";
            repeat = false;
          };
          "Mod+7" = {
            action = "workspace-switch 7";
            repeat = false;
          };
          "Mod+8" = {
            action = "workspace-switch 8";
            repeat = false;
          };
          "Mod+9" = {
            action = "workspace-switch 9";
            repeat = false;
          };
          "Mod+Shift+1" = {
            action = "window-move-to-workspace 1";
            repeat = false;
          };
          "Mod+Shift+2" = {
            action = "window-move-to-workspace 2";
            repeat = false;
          };
          "Mod+Shift+3" = {
            action = "window-move-to-workspace 3";
            repeat = false;
          };
          "Mod+Shift+4" = {
            action = "window-move-to-workspace 4";
            repeat = false;
          };
          "Mod+Shift+5" = {
            action = "window-move-to-workspace 5";
            repeat = false;
          };
          "Mod+Shift+6" = {
            action = "window-move-to-workspace 6";
            repeat = false;
          };
          "Mod+Shift+7" = {
            action = "window-move-to-workspace 7";
            repeat = false;
          };
          "Mod+Shift+8" = {
            action = "window-move-to-workspace 8";
            repeat = false;
          };
          "Mod+Shift+9" = {
            action = "window-move-to-workspace 9";
            repeat = false;
          };

          # Window focus and movement
          "Mod+Left" = {
            action = "window-focus-left";
          };
          "Mod+Down" = {
            action = "window-focus-down";
          };
          "Mod+Up" = {
            action = "window-focus-up";
          };
          "Mod+Right" = {
            action = "window-focus-right";
          };
          "Mod+F1" = {
            action = "window-focus-next";
          };
          "Mod+Shift+Left" = {
            action = "column-move-left";
          };
          "Mod+Shift+Down" = {
            action = "window-move-down";
          };
          "Mod+Shift+Up" = {
            action = "window-move-up";
          };
          "Mod+Shift+Right" = {
            action = "column-move-right";
          };

          # Window state and layout
          "Mod+T" = {
            action = "window-toggle-floating";
            repeat = false;
          };
          "Mod+Shift+T" = {
            action = "window-focus-switch-floating";
            repeat = false;
          };
          "Mod+P" = {
            action = "window-toggle-pinned";
            repeat = false;
          };
          "Mod+M" = {
            action = "window-toggle-maximize";
            repeat = false;
          };
          "Mod+F" = {
            action = "window-toggle-fullscreen";
            repeat = false;
          };
          "Mod+R" = {
            action = "window-cycle-primary-extent";
            repeat = false;
          };
          "Mod+Shift+R" = {
            action = "window-cycle-primary-extent-back";
            repeat = false;
          };
          "Mod+Minus" = {
            action = "window-modify-primary-extent -0.02";
            repeat = false;
          };
          "Mod+Equal" = {
            action = "window-modify-primary-extent +0.02";
            repeat = false;
          };
          "Mod+Ctrl+Minus" = {
            action = "window-modify-secondary-extent -0.02";
            repeat = false;
          };
          "Mod+Ctrl+Equal" = {
            action = "window-modify-secondary-extent +0.02";
            repeat = false;
          };
          "Mod+Comma" = {
            action = "window-consume-left";
            repeat = false;
          };
          "Mod+Period" = {
            action = "window-consume-right";
            repeat = false;
          };
          "Mod+Ctrl+Comma" = {
            action = "window-consume-from-left";
            repeat = false;
          };
          "Mod+Ctrl+Period" = {
            action = "window-consume-from-right";
            repeat = false;
          };
          "Mod+W" = {
            action = "column-toggle-tabbed";
            repeat = false;
          };
          "Mod+Alt+Right" = {
            action = "column-focus-tab-next";
            repeat = false;
          };
          "Mod+Alt+Left" = {
            action = "column-focus-tab-previous";
            repeat = false;
          };
          "Mod+WheelUp" = {
            action = "window-focus-left";
            repeat = false;
          };
          "Mod+WheelDown" = {
            action = "window-focus-right";
            repeat = false;
          };
          "Mod+O" = {
            action = "overview-toggle";
            repeat = false;
          };
          "Mod+Q" = {
            action = "window-close";
            repeat = false;
          };

          # Scratchpad
          "Mod+Shift+Space" = {
            action = "window-move-to-scratchpad";
            repeat = false;
          };
          "Mod+Space" = {
            action = "scratchpad-toggle";
            repeat = false;
          };
          "Mod+Ctrl+Space" = {
            action = "window-restore-from-scratchpad";
            repeat = false;
          };
          "Mod+Tab" = {
            action = "scratchpad-focus-next";
            repeat = false;
          };
        };
      };
    };
}

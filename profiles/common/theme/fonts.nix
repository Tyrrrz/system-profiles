{ config, pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      noto-fonts-color-emoji
    ];

    fontconfig.defaultFonts = {
      serif = [ "DejaVu Serif" ];
      sansSerif = [ "DejaVu Sans" ];
      monospace = [ "DejaVu Sans Mono" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}

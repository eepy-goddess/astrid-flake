{ config, lib, pkgs, ... }:

let configText = builtins.readFile ./config/kitty.conf;
in {
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.7";
      background = "#${config.colorScheme.palette.base00}";
      foreground = "#${config.colorScheme.palette.base05}";
      cursor = "#${config.colorScheme.palette.base01}";
      color1 = "#${config.colorScheme.palette.base01}";
      color2 = "#${config.colorScheme.palette.base02}";
      color3 = "#${config.colorScheme.palette.base03}";
      color4 = "#${config.colorScheme.palette.base04}";
      color5 = "#${config.colorScheme.palette.base05}";
      color6 = "#${config.colorScheme.palette.base06}";
      color7 = "#${config.colorScheme.palette.base07}";
      color8 = "#${config.colorScheme.palette.base08}";
      color9 = "#${config.colorScheme.palette.base09}";
      color10 = "#${config.colorScheme.palette.base0A}";
      color11 = "#${config.colorScheme.palette.base0B}";
      color12 = "#${config.colorScheme.palette.base0C}";
      color13 = "#${config.colorScheme.palette.base0D}";
      color14 = "#${config.colorScheme.palette.base0E}";
      color15 = "#${config.colorScheme.palette.base0F}";
    };
  };
}

{ config, hyprland, lib, pkgs, ... }:
let
  configText = builtins.readFile ./config/hyprland.conf;
in
{
  imports = [ hyprland.homeManagerModules.default ];
  wayland.windowManager.hyprland = {
    enable = true;
    nvidiaPatches = true;
    extraConfig = ''
      ${configText}
    '';
  };
}

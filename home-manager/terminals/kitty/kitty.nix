{ config, lib, pkgs, ... }:
let
  configText = builtins.readFile ./config/kitty.conf;
in
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      ${configText}
    '';
  };
}

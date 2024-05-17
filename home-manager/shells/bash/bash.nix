{ config, lib, pkgs, ... }:
let configText = builtins.readFile ./config/bashrc;
in {
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      ${configText}
    '';
  };
}

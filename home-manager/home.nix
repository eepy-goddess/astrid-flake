{ config, lib, pkgs, ... }: {
  home.stateVersion = "22.11";

  imports = [
    ./shells/nushell/nushell.nix
    ./status-bars/waybar/waybar.nix
    ./shells/bash/bash.nix
    ./terminals/kitty/kitty.nix
  ];

}

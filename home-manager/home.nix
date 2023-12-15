{ config, lib, pkgs, ... }: {
  home.stateVersion = "22.11";
  imports = [
    ./shells/shells.nix
    ./status-bars/status-bars.nix
    ./terminals/terminals.nix
    ./app-launchers/app-launchers.nix
  ];

  programs.pywal.enable = true;

}

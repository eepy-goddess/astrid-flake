{ config, libs, pkgs, ... }: {
  imports = [
    ./bash/bash.nix
    ./nushell/nushell.nix
  ];
}

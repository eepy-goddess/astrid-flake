{ config, lib, pkgs, ... }: {
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      ./config/.bashrc
    '';
  };
}

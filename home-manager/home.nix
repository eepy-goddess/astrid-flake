{ config, lib, pkgs, ... }: {
  home.stateVersion = "22.11";
  imports = [
    ./shells/shells.nix
    ./status-bars/status-bars.nix
    ./terminals/terminals.nix
    ./app-launchers/app-launchers.nix
  ];

  home.packages = with pkgs; [
    wine
    prismlauncher
    firefox
    vscode
    sxhkd
    libsForQt5.breeze-gtk
    hyfetch
    lutris
    noto-fonts-cjk-sans
    git
    lxappearance
    cups
    neofetch
    neovim
    wget
    wl-clipboard
    armcord
    flameshot
    pfetch
    pamixer
  ];

  home.username = "astrid";
  home.homeDirectory = "/home/astrid";
  programs.home-manager.enable = true;

  programs.pywal.enable = true;
  programs.direnv.enable = true;
}

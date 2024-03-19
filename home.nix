{ config, lib, pkgs, ... }: {
  home.stateVersion = "22.11";
  imports = [
    ./home-manager/shells/shells.nix
    ./home-manager/status-bars/status-bars.nix
    ./home-manager/terminals/terminals.nix
    ./home-manager/app-launchers/app-launchers.nix
    ./home-manager/window-managers/window-managers.nix
  ];

  home.packages = with pkgs; [
    wine
    prismlauncher
    firefox
    vscode
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
  nixpkgs.config.allowUnfree = true;
}

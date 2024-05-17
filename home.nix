{ config, lib, pkgs, nix-colors, ... }:
let

  nix-colors-contrib = nix-colors.lib.contrib { inherit pkgs; };

in {
  imports = [
    ./home-manager/shells/shells.nix
    ./home-manager/status-bars/status-bars.nix
    ./home-manager/terminals/terminals.nix
    ./home-manager/app-launchers/app-launchers.nix
    ./home-manager/window-managers/window-managers.nix

    nix-colors.homeManagerModules.default
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
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
      pfetch
      pamixer
      superTuxKart
      wl-clipboard
      river-bsp-layout
    ];

    file = {
      ".xinitrc".source = ./resources/xinitrc;
      "wallpaper.png".source = ./resources/wallpaper.png;
    };

    username = "astrid";
    homeDirectory = "/home/astrid";
  };

  colorScheme = nix-colors-contrib.colorSchemeFromPicture {
    path = ./resources/wallpaper.png;
    variant = "dark";
  };

  services.flameshot.enable = true;
  programs = {
    pywal.enable = true;
    direnv.enable = true;
    home-manager.enable = true;
    wofi.enable = true;
  };
}

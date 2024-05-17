# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    timeout = 5;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
  };
  boot.kernelParams = [ "module_blacklist=i915,iwlwifi" ];
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6;
  boot.extraModulePackages = with pkgs;
    [ linuxKernel.packages.linux_6_6.rtl88x2bu ];

  networking.hostName = "nyaaxOwOs"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  # Enable flakesYQt
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];

      extra-substituters = [ "https://cache.lix.systems" ];

      trusted-public-keys =
        [ "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o=" ];
    };
  };
  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable XDG
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # X11 config
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "intl";
    };
    autorun = true;
    videoDrivers = [ "nvidia" ];
    libinput.enable = true;
    displayManager.startx.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.astrid = {
    isNormalUser = true;
    description = "astrid";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.bash;
    packages = with pkgs; [ ];
  };
  services.flatpak.enable = true;

  programs.steam.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  hardware = {
    firmware = with pkgs; [ sof-firmware ];

    bluetooth.enable = true;
    nvidia = {
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    opengl.enable = true;
  };
  programs.fish.enable = true;
  programs.gnupg.agent.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };
  services.picom.enable = true;
  programs.dconf.enable = true;
  services.printing = {
    enable = true;
    drivers = with pkgs; [ canon-cups-ufr2 ];
  };
  services.blueman.enable = true;

  virtualisation = { libvirtd.enable = true; };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

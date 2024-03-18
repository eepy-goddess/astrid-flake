# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, magmawm, ... }:
{
  imports =
    [
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
  boot.extraModulePackages = with pkgs; [
    linuxKernel.packages.linux_6_6.rtl88x2bu
  ];
  hardware.firmware = with pkgs; [
    sof-firmware
  ];
  networking.hostName = "nyaaxOwOs"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable XDG
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.astrid = {
    isNormalUser = true;
    description = "astrid";
    extraGroups = [ "networkmanager" "wheel" "vboxusers" "libvirtd" ];
    shell = pkgs.bash;
    packages = with pkgs; [
    ];
  };
  services.flatpak.enable = true;
  # steam crap
  programs.steam.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  hardware.nvidia.modesetting.enable = true;
  services.xserver = {
    enable = true;
    autorun = true;
    videoDrivers = [ "nvidia" ];
    libinput.enable = true;
    displayManager.startx.enable = true;
    windowManager.bspwm.enable = true;
  };
  programs.fish.enable = true;
  programs.gnupg.agent.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };
  hardware.opengl.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  services.picom.enable = true;
  hardware.bluetooth.enable = true;
  programs.dconf.enable = true;
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      canon-cups-ufr2
    ];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];
  services.blueman.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    virtualbox.host = {
      enable = true;
    };
  };


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
  system.stateVersion = "unstable"; # Did you read the comment?

}

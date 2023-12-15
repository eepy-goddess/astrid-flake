# My Flake
Contains my nixos config. There is also a flake output available to set up my home-manager config even if you don't have nixos.

## IMPORTANT
DO NOT FORGET TO `nixos-generate-config --show-hardware-config --root <your root dir> | tee /path/to/astrid-flake/nixos/hardware-configuration.nix` BEFORE REBULDING 
NIXOS WITH THE FLAKE!!! Worst mistake of my life!

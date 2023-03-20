{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, hyprland, home-manager, ... }: {
    nixosConfigurations.nyaaxOwOs = nixpkgs.lib.nixosSystem {
      # ...
      system = "x86_64-linux";
      modules = [
        hyprland.nixosModules.default
        {
          programs.hyprland.enable = true;
          programs.hyprland.nvidiaPatches = true;
        }

        home-manager.nixosModules.default
        {
          home-manager.useUserPackages = true;
          home-manager.useGlobalPkgs = true;
          home-manager.users.astrid = import ./home-manager/home.nix;
        }
        ./nixos/configuration.nix
      ];
    };
  };
}

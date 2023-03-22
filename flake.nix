{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland/37ced6aca4ad8f18f8e205e3cdb6de9c8964d4b6";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }: {
    nixosConfigurations.nyaaxOwOs = nixpkgs.lib.nixosSystem {
      # ...
      system = "x86_64-linux";
      modules = [
        home-manager.nixosModules.default
        {
          home-manager.useUserPackages = true;
          home-manager.useGlobalPkgs = true;
          home-manager.extraSpecialArgs = {
            inherit hyprland;
          };
          home-manager.users.astrid = import ./home-manager/home.nix;
        }
        ./nixos/configuration.nix
      ];
    };
  };
}

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
      nixosConfigurations.nyaaxOwOs = nixpkgs.lib.nixosSystem {
        # ...
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.default
          {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.astrid = import ./home-manager/home.nix;
          }
          ./nixos/configuration.nix
        ];
      };

      homeConfigurations.astrid = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home-manager/non-nixos.nix
          ./home-manager/home.nix
        ];
      };
    };
}

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anime-launcher = { 
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, anime-launcher, ... }:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
      nixosConfigurations.nyaaxOwOs = nixpkgs.lib.nixosSystem {
        # ...
        system = "x86_64-linux";
        modules = [
	  anime-launcher.nixosModules.default 
          {
	    programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
            programs.anime-borb-launcher.enable = true;
            programs.honkers-railway-launcher.enable = true;
            programs.honkers-launcher.enable = true;
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
      homeConfigurations.astrid = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home-manager/non-nixos.nix
          ./home-manager/home.nix
        ];
      };
    };
}

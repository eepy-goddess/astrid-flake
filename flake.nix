{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix = {
      url =
        "git+https://git@git.lix.systems/lix-project/lix?ref=refs/tags/2.90-beta.1";
      flake = false;
    };

    lix-module = {
      url = "git+https://git.lix.systems/lix-project/nixos-module";
      inputs.lix.follows = "lix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:Misterio77/nix-colors";
    river-bsp-layout.url = "/home/astrid/projects/river-bsp-layout";
  };

  outputs =
    { nixpkgs, home-manager, nix-colors, river-bsp-layout, lix-module, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs rec {
        inherit system;
        overlays = [ river-bsp-layout.overlays."${system}".default ];
      };
    in {
      formatter."${system}" = pkgs.nixfmt-classic;
      nixosConfigurations.nyaaxOwOs = nixpkgs.lib.nixosSystem {
        # ...
        inherit system;
        modules = [ lix-module.nixosModules.default ./nixos/configuration.nix ];
      };
      homeConfigurations.astrid = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];

        extraSpecialArgs = { inherit nix-colors; };
      };
    };
}

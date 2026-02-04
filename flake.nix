{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nix-matlab = {
      # Recommended if you also override the default nixpkgs flake, common among
      # nixos-unstable users:
      #inputs.nixpkgs.follows = "nixpkgs";
      url = "gitlab:doronbehar/nix-matlab";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";
    factorioSpaceAge.url = "github:priegger/nixpkgs/update-factorio";
    factorioSpaceAge.flake = false;
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    nixCats-lazyVim.url = "path:flakes/nixCats-lazyVim";
    comma.url = "github:nix-community/comma";
    nix-index.url = "github:nix-community/nix-index";
  };

  nixConfig = {
    extra-substituters = [
      "https://nixos-raspberrypi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
    ];
  };

  outputs = { self, nixpkgs, nix-matlab, home-manager, nixvim, impermanence, factorioSpaceAge, nixos-raspberrypi, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      flake-overlays = [
        nix-matlab.overlay
      ];

      factorio = import factorioSpaceAge {
        inherit system;
        config = {};
      };
    in
    {
      nixosConfigurations.g15 = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs; inherit factorio; a = impermanence.homeManagerModules.impermanence; };
           modules = [ 
            (import ./hosts/g15/default.nix flake-overlays)

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              #home-manager.backupFileExtension = "bak";
            }

            #nixvim.nixosModules.nixvim
          ];
        };

      nixosConfigurations.rpi5 = nixos-raspberrypi.lib.nixosSystem {
          specialArgs = { 
            inherit inputs;
            inherit nixos-raspberrypi; # this has to be here for reasons unknown to me
          };
         modules = [
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }

            ./hosts/rpi5
          ];
        };

    };
}

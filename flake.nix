{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    factorioSpaceAge.url = "github:priegger/nixpkgs/update-factorio";
    factorioSpaceAge.flake = false;
  };

  outputs = { self, nixpkgs, nix-matlab, home-manager, nixvim, impermanence, factorioSpaceAge, ... }@inputs:
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
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs; inherit factorio;};
          modules = [ 
            impermanence.nixosModules.impermanence
            (import ./configuration.nix flake-overlays)

            home-manager.nixosModules.home-manager
            {
              #home-manager.useGlobalPkgs = true;
              #home-manager.useUserPackages = true;
              home-manager.users.dani = import ./home.nix impermanence;
              #home-manager.backupFileExtension = "bak";
            }

            #nixvim.nixosModules.nixvim
          ];
        };

    };
}

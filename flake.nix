{
inputs = {
  # ...
  nix-matlab = {
    # Recommended if you also override the default nixpkgs flake, common among
    # nixos-unstable users:
    #inputs.nixpkgs.follows = "nixpkgs";
    url = "gitlab:doronbehar/nix-matlab";
  };
  # ...
  outputs = { self, nixpkgs, nix-matlab }:
  let
    flake-overlays = [
      nix-matlab.overlay
    ];
  in {
    nixosConfigurations =( 
      dani_laptop = nixpkgs.lib.nixosSystem {
        modules = [ (import ./configuration.nix flake-overlays) ]
      };)
    };
  };
};


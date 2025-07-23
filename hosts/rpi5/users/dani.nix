{ ... }:
{
  imports = [
    ../../../users/dani
  ];

  # to do make an option for extra directories in impermanence module
  home-manager.users.dani = {
    imports = [ ../../../users/dani/homeManagerModules/impermanence.nix ];
  };

}

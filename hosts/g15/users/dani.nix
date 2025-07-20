{ ... }:
{
  imports = [
    ../../../users/dani
    ../../../users/dani/desktop-pkgs.nix
  ];

  # to do make an option for extra directories in impermanence module
  home-manager.users.dani = {
    imports = [ ../../../users/dani/homeManagerModules/impermanence.nix ];
    home.persistence."/persistence/home" = {
      directories = [
        "ctf"
        "Documents"
        "Downloads" # to do remove
        "Games"
        "Music"
        "obsidian"
        "passwords"
        "Pictures"
        "projects"
        "sdu"
        "Videos"
        "wallpapers"
        ".factorio"
        ".local" # to do change
        ".config/Code"
        ".config/discord"
        ".config/vivaldi"
      ];
    };
  };
}

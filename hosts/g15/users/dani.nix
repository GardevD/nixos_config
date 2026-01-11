{ ... }:
{
  imports = [
    ../../../users/dani
    ../../../users/dani/desktop-pkgs.nix
  ];

  # to do make an option for extra directories in impermanence module
  home-manager.users.dani = {
    imports = [ 
      ../../../users/dani/homeManagerModules/impermanence.nix
      ../../../users/dani/homeManagerModules/gnome.nix
      ../../../users/dani/homeManagerModules/hyprland.nix
    ];
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
        ".local/lib/vivaldi"
        ".local/share/Anki2"
        ".local/share/Steam"
        ".local/share/Terraria"
        ".config/Code"
        ".config/discord"
        ".config/vivaldi"
      ];
    };
  };
}

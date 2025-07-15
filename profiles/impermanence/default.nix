{pkgs, ...}:
{
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
      ".gnupg"
      ".ssh"
      ".nixops"
      ".local" # to do change
      ".config/Code"
      ".config/discord"
      ".config/vivaldi"
   ];
    files = [
      ".bash_history"
    ];
    allowOther = true; # allows other users to access binmounted directories, useful for sudo
  };
}

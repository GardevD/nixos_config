{pkgs, inputs, ...}:
{

  home.persistence."/persistence" = {
    directories = [
      ".gnupg"
      ".ssh"
      ".nixops"
      ".local/share/zoxide"
      ".cache/nix-index"
   ];
    files = [
      ".bash_history"
    ];
  };
}

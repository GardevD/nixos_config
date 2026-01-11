{pkgs, inputs, ...}:
{

  home.persistence."/persistence/home" = {
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

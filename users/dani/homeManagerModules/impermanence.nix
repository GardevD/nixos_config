{pkgs, inputs, ...}:
{

  home.persistence."/persistence" = {
    directories = [
      ".gnupg"
      ".ssh"
      ".nixops"
      ".local/share/zoxide"
      ".cache/nix-index"
      ".config/sops/age"
   ];
    files = [
      ".bash_history"
    ];
  };
}

{pkgs, inputs, ...}:
{
  imports = [
    inputs.impermanence.homeManagerModules.impermanence
  ];

  home.persistence."/persistence/home" = {
    directories = [
      ".gnupg"
      ".ssh"
      ".nixops"
   ];
    files = [
      ".bash_history"
    ];
    allowOther = true; # allows other users to access binmounted directories, useful for sudo
  };
}

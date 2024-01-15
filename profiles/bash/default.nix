{...}:
{
  programs.bash = {
    enable = true;
    historyIgnore = ["ls" "cd"];
    shellAliases = {
      nr = "nix run";
      nd = "nix develop";
    };
  };
}

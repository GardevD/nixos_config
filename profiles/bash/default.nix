{pkgs, ...}:
{
  #why do I need to specify allowUnfree again?
  nixpkgs.config.allowUnfree = true;
  programs.bash = {
    enable = true;
    historyIgnore = ["ls" "cd"];
    shellAliases = {
        nr = "nix run";
        nd = "nix develop";
    };
    sessionVariables = {
        XDG_DATA_HOME="$HOME/.local/share";
    };
    initExtra = ''
        echo ${pkgs.discord}
        mkdir -p ~/.local/share/applications
        sed 's/^Exec=/&nvidia-offload /' ${pkgs.discord}/share/applications/discord.desktop > ~/.local/share/applications/discord.desktop
        sed 's/^Exec=/&nvidia-offload /' ${pkgs.vivaldi}/share/applications/vivaldi-stable.desktop > ~/.local/share/applications/vivaldi-stable.desktop
    '';
  };
}

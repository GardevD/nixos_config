{pkgs, ...}:
{
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
        mkdir -p ~/.local/share/applications
        sed 's/^Exec=/&nvidia-offload /' ${pkgs.discord}/share/applications/discord.desktop > ~/.local/share/applications/discord.desktop
        sed 's/^Exec=/&nvidia-offload /' ${pkgs.vivaldi}/share/applications/vivaldi-stable.desktop > ~/.local/share/applications/vivaldi-stable.desktop
    '';
  };
}

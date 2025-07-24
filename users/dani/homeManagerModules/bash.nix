{pkgs, ...}:
{
  nixpkgs.config.allowUnfree = true;
  programs.bash = {
    enable = true;
    historyIgnore = ["ls" "cd"];
    shellAliases = {
        nr = "nix run";
        nd = "nix develop";
        update-system = "nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos";
    };
    /* to do: make an option for these + check fi there is a better alternative than this
    sessionVariables = {
        XDG_DATA_HOME="$HOME/.local/share";
    };
    initExtra = ''
        mkdir -p ~/.local/share/applications
        sed 's/^Exec=/&nvidia-offload /' ${pkgs.discord}/share/applications/discord.desktop > ~/.local/share/applications/discord.desktop
        sed 's/^Exec=/&nvidia-offload /' ${pkgs.vivaldi}/share/applications/vivaldi-stable.desktop > ~/.local/share/applications/vivaldi-stable.desktop
    '';
    */
  };
}

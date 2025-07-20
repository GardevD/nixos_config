{pkgs, factorio, ...}:
{
  users.users.dani.packages = with pkgs; [
    anki
    discord
    vscodium
    vscode
    keepassxc
    matlab
    krita
  ];

  programs.steam.enable = true;

  # factorio
  system.extraDependencies = [
    factorio.factorio-space-age.src
  ];
}

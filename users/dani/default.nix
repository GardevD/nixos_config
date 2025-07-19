{ pkgs, factorio, inputs, ... }:
{
  imports = [
      inputs.nixvim.nixosModules.nixvim
      ../../profiles/nixvim
  ];

  programs.steam.enable = true;
  # factorio
  system.extraDependencies = [
    factorio.factorio-space-age.src
  ];


  users.users.dani = {
    isNormalUser = true;
    description = "Gardev Dániel";
    initialHashedPassword = "$y$j9T$eB1piEmD1KMDq6r1ShZXR/$1vFOtpbzwEWD.xPikpLnyacVSLHmU2Sa6vbrvgTt84/";
    hashedPassword = "$y$j9T$eB1piEmD1KMDq6r1ShZXR/$1vFOtpbzwEWD.xPikpLnyacVSLHmU2Sa6vbrvgTt84/";
    extraGroups = [ "docker" "networkmanager" "wheel" "vboxusers" ];
    packages = with pkgs; [
      anki
      discord
      lutris
      steam
      vscodium
      vscode
      keepassxc
      blender
      matlab
      krita
      wine
    ];
  };
}

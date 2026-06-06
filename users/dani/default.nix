{ pkgs, inputs, ... }:
{
  imports = [];


  users.users.dani = {
    isNormalUser = true;
    description = "Gardev Dániel";
    initialHashedPassword = "$y$j9T$eB1piEmD1KMDq6r1ShZXR/$1vFOtpbzwEWD.xPikpLnyacVSLHmU2Sa6vbrvgTt84/";
    hashedPassword = "$y$j9T$eB1piEmD1KMDq6r1ShZXR/$1vFOtpbzwEWD.xPikpLnyacVSLHmU2Sa6vbrvgTt84/";
    extraGroups = [ "docker" "networkmanager" "wheel" "vboxusers" "plugdev" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.dani = { 
      imports = [
        ./home.nix
      ];
    };
  };
}

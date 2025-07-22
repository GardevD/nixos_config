{ pkgs, lib, inputs, ... }: {
  imports = [
    inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.base
    inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.bluetooth
    ./users
    ./hardware-configuration.nix
    ../nixosModules/common.nix
    ../nixosModules/impermanence.nix
  ];
  networking.hostName = "rpi5";

  services.openssh.enable = true;
  networking.networkmanager.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      workstation = true;
    };
  };

  /*
  services.immich = {
    enable = true;
    database.enable = false;
    port = 2283;
  };
  */

  system.stateVersion = "25.05";
}

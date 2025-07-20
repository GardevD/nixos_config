{ pkgs, lib, inputs, ... }: {
  imports = [
    inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.base
    inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.bluetooth
    ./users
    ./hardware-configuration.nix
  ];
  networking.hostName = "rpi5";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
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
  nixpkgs.overlays = [ (
    self: super: {
    jemalloc = super.jemalloc.overrideAttrs (old: {
    configureFlags = (lib.filter (flag: flag != "--with-lg-page=16") old.configureFlags) ++ [ "--with-lg-page=14" ];
    });
    }
  ) ];
  
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
  };

  services.immich = {
    enable = true;
    port = 2283;
    package = nixpkgs.legacyPackages."aarch64-linux".immich;
  };
  */
  system.stateVersion = "25.05";
}

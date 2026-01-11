{ pkgs, lib, inputs, ... }: {
  imports = [
    inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.base
    inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.bluetooth
    ./users
    ./hardware-configuration.nix
    ../nixosModules/common.nix
    ../nixosModules/immich.nix
    ../nixosModules/impermanence.nix
    ../nixosModules/wireguard-server.nix
    ../nixosModules/ssh-server.nix
  ];
  networking.hostName = "rpi5";

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

  virtualisation.docker.enable = true;

  time.timeZone = "Europe/Budapest";
  /*
  users.groups.media = {};
  services.jellyseerr = {
    enable = true;
    port = 5056; # 5055 is taken by traccar
    openFirewall = true;
  };
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    group = "media";
  };

  services.radarr = {
    enable = true;
    openFirewall = true;
    group = "media";
  };

  services.transmission = {
    enable = true;
    openPeerPorts = true;
    openRPCPort = true;
    settings = {
      rpc-bind-address = "0.0.0.0";
      rpc-whitelist = "127.0.0.1,10.100.0.3,192.168.0.23";
    };
    group = "media";
  };

  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };
*/

  services.traccar = {
    enable = true;

  };

  networking.firewall = {
    allowedTCPPorts = [ 8082 5055 ]; # traccar manager and client thing
  };

  system.stateVersion = "25.05";
}

{ pkgs, lib, inputs, ... }: {
  imports = [
    inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.base
    inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.bluetooth
    ./users
    ./hardware-configuration.nix
    ../nixosModules/common.nix
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

  
  users.groups.media = {};
  services.jellyseerr = {
    enable = true;
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

  /*
  nixpkgs.overlays = [
    (self: super:
      let
        pkgsUnstable = import inputs.nixpkgs { system = "aarch64-linux"; };
      in
      {
        vectorchord = pkgsUnstable.postgresql16Packages.vectorchord;
      }
    )
  ];

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16.withPackages (ps: [ ps.pgvector pkgs.vectorchord ]);

    ensureDatabases = [ "immich" ];
      ensureUsers = [
        {
          name = "immich";
          ensureDBOwnership = true;
          ensureClauses.login = true;
        }
      ];
      extensions = ps: [ ps.pgvector pkgs.vectorchord ];
      settings = {
        shared_preload_libraries = [ "vchord.so" ];
        search_path = "\"$user\", public, vectors";
      };

  };

  services.immich = {
    enable = true;
    database.enable = false;
    port = 2283;
  };
  */

  system.stateVersion = "25.05";
}

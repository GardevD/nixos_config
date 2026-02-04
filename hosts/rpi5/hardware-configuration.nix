{ ... }: {
  imports = [
    ../nixosModules/zfs.nix
  ];

  networking.hostId = "0b8c8ce9";
  fileSystems = {
   "/" = {
      neededForBoot = true;
      device = "rpool/root";
      fsType = "zfs";
      options = [ "noatime" ];
    };
    "/nix" = {
      neededForBoot = true;
      device = "rpool/nix";
      fsType = "zfs";
      options = [ "noatime" ];
    };
    "/persistence" = {
      neededForBoot = true;
      device = "rpool/persistence";
      fsType = "zfs";
      options = [ "noatime" ];
    };
    "/persistence/home" = {
      neededForBoot = true;
      device = "rpool/home";
      fsType = "zfs";
      options = [ "noatime" ];
    };
    "/vault/immich"  = {
      device = "vault/immich";
      fsType = "zfs";
      options = [ "noatime" ];
    };
    "/boot/firmware" = {
      device = "/dev/disk/by-uuid/FA91-73AD";
      fsType = "vfat";
      options = [
        "noatime"
        "noauto"
        "x-systemd.automount"
        "x-systemd.idle-timeout=1min"
      ];
    };
 
  };

  swapDevices =
  [
      { device = "/dev/disk/by-uuid/9e904e0c-cd40-4103-9b9c-5bbf541e6321"; }
  ];
}

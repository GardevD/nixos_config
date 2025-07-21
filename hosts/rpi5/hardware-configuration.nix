{ ... }: {
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

  boot.supportedFilesystems = [ "zfs" ];
  boot.initrd.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = true;
}

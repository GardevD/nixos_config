{ ... }: {
  networking.hostId = "0b8c8ce9";
  fileSystems = {
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
    "/" = {
      device = "rpool/root";
      fsType = "zfs";
      options = [ "noatime" ];
    };
  };

  boot.supportedFilesystems = [ "zfs" ];
  boot.initrd.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = true;
}

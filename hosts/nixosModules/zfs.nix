{ ... }:
{
  boot.supportedFilesystems = [ "zfs" ];
  boot.initrd.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = true;
  services.zfs.autoScrub.enable = true;
}

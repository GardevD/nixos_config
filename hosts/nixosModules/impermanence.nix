{ lib, inputs, ... }: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  environment.persistence."/persistence" = {
    enable = true;  # NB: Defaults to true, not needed
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/etc/ssh"
      "/var/lib/nixos" # https://github.com/nix-community/impermanence/pull/114
      "/var/lib/acme"
      "/var/lib/mysql"
      "/var/lib/systemd/timers"
      "/var/log/journal"
      "/run/log/journal"
      "/var/lib/bluetooth"
      "/etc/NetworkManager/system-connections"
      "/etc/wireguard" # to do make an option for this and move to wireguard setup
    ];

    files = [
      "/etc/machine-id"
    ];
  };
  programs.fuse.userAllowOther = true; # needed for home-manager impermanence config


  boot.initrd.postMountCommands = lib.mkAfter ''
    timestamp=$(date "+%Y-%m-%d_%H-%M-%S")
    zfs snapshot rpool/root@archived-$timestamp
    zfs send rpool/root@archived-$timestamp | zfs recv rpool/archived/archived-$timestamp
    echo "Archive snapshot created: rpool/archived/archived-$timestamp"

    zfs list -o name -s creation | grep '^rpool/archived/archived-' | head -n -10 | while read archive; do
      echo "Destroying old arhcive: $archive"
      zfs destroy -r "$archive"
    done

    if zfs rollback -r rpool/root@empty; then
      echo "[initrd] ZFS rollback successful."
    else
      echo "[initrd] ZFS rollback failed!"
    fi'';

}

{ inputs, ... }: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ]
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
      "/var/log"
      "/var/lib/bluetooth"
      "/etc/NetworkManager/system-connections"
    ];

    files = [
      "/etc/machine-id"
    ];
  };
  programs.fuse.userAllowOther = true; # needed for home-manager impermanence config
}

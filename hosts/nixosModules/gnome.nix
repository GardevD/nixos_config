{ pkgs, lib, ... }: {
  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs; [ epiphany geary gnome-contacts gnome-maps gnome-music gnome-weather gnome-connections ];

  services.gnome = {
    gnome-keyring.enable = lib.mkForce false;
    gnome-initial-setup.enable = false;
  };
}

{ lib, ... }: {
  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome = {
    gnome-keyring.enable = lib.mkForce false;
    gnome-initial-setup.enable = false;
  };
}

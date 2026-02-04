{lib, ...}:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;

      preload =
        [ "/home/dani/wallpapers/swamp1.jpg" ];

      wallpaper = [
        ", /home/dani/wallpapers/swamp1.jpg" # to do put in config
      ];
    };
  };
  systemd.user.services.hyprpaper.Unit.ConditionEnvironment = lib.mkForce "HYPRLAND_INSTANCE_SIGNATURE"; # originally it is set to "WAYLAND_DISPLAY"", but then it also tries to run on gnome-wayland
}

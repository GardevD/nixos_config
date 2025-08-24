{...}:
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
}

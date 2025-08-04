{pkgs, inputs, ...}:
{
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [ "('xkb', 'hu')" "('xkb', 'dk')" ];
      xkb-options = [
        "grp:win_space_toggle"
        "numpad:mac"
        "caps:escape"
      ];
    };
    "org/gnome/shell" = {
      # don't show welcome screen
      welcome-dialog-last-shown-version = "40.1";
    };
  };

}

{pkgs, inputs, lib, ...}:
with lib.hm.gvariant;
{
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple ["xkb" "hu"]) (mkTuple ["xkb" "dk"]) (mkTuple ["ibus" "pinyin"]) ];
      xkb-options = [ # rules explained in evdev.lst
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

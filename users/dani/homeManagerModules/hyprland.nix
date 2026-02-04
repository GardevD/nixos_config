{...}:
{
  imports = [
    ./hyprlock.nix
    ./hypridle.nix
    ./hyprpaper.nix
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    plugins = []; # to do look into plugins

    settings = {
      monitor = ",preferred,auto,auto";
      "$terminal" = "kitty";
      "$mainMod" = "ALT";

      input = {
        kb_layout = "hu,dk";
        kb_options = "grp:win_space_toggle, numpad:mac, caps:escape";
        repeat_rate = 40;
        repeat_delay = 400;
        scroll_method = "2fg"; # edge is also kinda cool

        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
          # some other stuff but defualts looks
        };

        bind = [
          "$mainMod+SHIFT, Q, exit"
          "$mainMod, T, exec, $terminal"
          "$mainMod, U, togglefloating"
          "$mainMod, J, movefocus, d"
          "$mainMod, K, movefocus, u"
          "$mainMod, L, movefocus, r"
          "$mainMod, H, movefocus, l"
          "$mainMod, C, killactive"
          "$mainMod+SHIFT, C, forcekillactive"
          "$mainMod+SHIFT, L, exec, hyprlock"
        ] ++
        builtins.concatLists 
          (builtins.genList (i: [ 
            "$mainMod, ${toString (i+1)}, workspace, ${toString (i+1)}"
            "$mainMod+SHIFT, ${toString (i+1)}, movetoworkspace, ${toString (i+1)}"
          ]) 9);
      };

      # animations

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_min_speed_to_force = 10;
        workspace_swipe_forever = true;
        # something about prefixes for workspaces ?
      };

      decoration = {
        rounding = 7;
        rounding_power = 3;
        dim_inactive = true;
        dim_strength = 0.3;
        # special screens?
        # dim around?
        # screen shader sounds fun
        # border_part_of_window = flase
        # blur
        shadow = {
          enabled = true;
          range = 2;
          render_power = 2;
          color = "rgba(76, 55, 210,1)";
          # there are a couple more settings
        };
      };

      general = {
        border_size = 1;
        gaps_in = 3;
        gaps_out = 0;
        # float?
        # idk what this is lol: gaps_workspaces = 5
        "col.inactive_border" = "rgba(29,30,132,1)";
        "col.active_border" = "rgba(147,200,231,1)";
        # groups?
        layout = "dwindle"; # checkout master
        # no_focus_fallback
        resize_on_border = true; # maybe set a key so it's less annoying
        # tearing ?
        snap = {
          enabled = true;
        };
      };
      misc = {
        # what is splash rendering ??
        # some other pretty good defaults
      };
    };
  };
}

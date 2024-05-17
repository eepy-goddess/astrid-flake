{ config, lib, pkgs, ... }: {
  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = true;

    extraSessionVariables = { WLR_NO_HARDWARE_CURSORS = "1"; };

    settings = {
      map.normal."Alt Return" = "spawn kitty";
      default-layout = "bsp-layout";
      map.normal."Alt+Shift c" = "close";
      map.normal."Alt p" = "spawn 'wofi --show run'";
      map.normal."Alt+Shift q" = "exit";

    };
    extraConfig = ''
            for i in {1..9}; do
              riverctl map normal Mod1 $i set-focused-tags $((1 << $(($i - 1))))
      	riverctl map normal Mod1+Shift $i set-view-tags $((1 << $(($i - 1))))
      	riverctl map normal Mod1+Control $i toggle-focused-tags $((1 << $(($i - 1))))
              riverctl map normal Mod1+Control+Shift $i toggle-view-tags $((1 << $(($i - 1))))
            done

            river-bsp-layout --inner-gap 5 --outer-gap 10 &
    '';
  };
}

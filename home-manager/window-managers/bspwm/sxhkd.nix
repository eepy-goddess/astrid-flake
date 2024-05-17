{ config, lib, pkgs, ... }: {
  services.sxhkd = {
    enable = true;
    keybindings = {
      "alt + Return" = "kitty";
      "alt + p" = "rofi -show run";
      "alt + {_, shift + } {1-9,0}" = "bspc {desktop -f, node -d} '^{1-9,10}'";
      "alt + shift + {q,r}" = "bspc {quit, wm -r}";
      "alt + Escape" = "pkill -USR1 -x sxhkd";
      "alt + shift + c" = "bspc node -c";
      "alt + s" = "flameshot gui";
      "{XF86AudioLowerVolume,XF86AudioMute,XF86AudioRaiseVolume}" =
        "pamixer {-d,-t,-i} {5,toggle,5}";
    };
  };
}

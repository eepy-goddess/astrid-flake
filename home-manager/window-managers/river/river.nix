{ config, lib, pkgs, ... }: let
  river = config.astridConfig.windowManagers.river;
in {

options = {
  astridConfig.windowManagers.river = {
    enable = lib.mkEnableOption "river";

    modKey = lib.mkOption {
      type = lib.types.str;
      default = "Super";
      description = "Primary mod key used for river keybinds";
      example = "Super";
    };
  };
};

config = lib.mkIf river.enable {
    wayland.windowManager.river = {
      enable = true;
      xwayland.enable = true;

      extraSessionVariables = { WLR_NO_HARDWARE_CURSORS = "1"; };

      settings = {
        map.normal."${river.modKey} Return" = "spawn kitty";
        default-layout = "bsp-layout";
        map.normal."${river.modKey}+Shift c" = "close";
        map.normal."${river.modKey} p" = "spawn 'wofi --show run'";
        map.normal."${river.modKey}+Shift q" = "exit";

      };
      extraConfig = ''
        for i in {1..9}; do
          riverctl map normal ${river.modKey} $i set-focused-tags $((1 << $(($i - 1))))
      	  riverctl map normal ${river.modKey}+Shift $i set-view-tags $((1 << $(($i - 1))))
      	  riverctl map normal ${river.modKey}+Control $i toggle-focused-tags $((1 << $(($i - 1))))
          riverctl map normal ${river.modKey}+Control+Shift $i toggle-view-tags $((1 << $(($i - 1))))
        done

        river-bsp-layout --inner-gap 5 --outer-gap 10 &
      '';
    };
  };
}

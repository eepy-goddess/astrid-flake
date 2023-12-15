{config, lib, pkgs, ...}: {
  services.polybar = {
    enable = true;
    config = ./config/config.ini;
    package = pkgs.polybar.override {
      pulseSupport = true;
    };
    script = ''
      polybar
    '';
/*
    settings = {
      "colors" = {
	foreground = "\${xrdb:foreground:f3f4f5}";
	background = "\${xdrb:background:2f343f}";
	
	black = "\${xrdb:color0}";
	darkred = "\${xrdb:color1}";
	darkgreen = "\${xrdb:color2}";
	darkyellow = "\${xrdb:color3}";
	darkblue = "\${xrdb:color4}";
	darkmagenta = "\${xrdb:color5}";
	darkcyan = "\${xrdb:color6}";
	grey = "\${xrdb:color7}";

	lightgray = "\${xrdb:color8}";
	red = "\${xrdb:color9}";
	green = "\${xrdb:color10}";
      }
    }
    */
  };
}

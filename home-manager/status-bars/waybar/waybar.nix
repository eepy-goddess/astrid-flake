{ config, lib, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      patchPhase = ''
        sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp
      '';
    });
  };

  xdg.configFile."waybar/config" = {
    source = ./config/config;
  };
  xdg.configFile."waybar/style.css" = {
    source = ./config/style.css;
  };
}

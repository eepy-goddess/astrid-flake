{ pkgs, libs, config, ... }:
let
  username = home.username;
in
{
  home.username = "astrid";
  home.homeDirectory = "/home/${username}";
}

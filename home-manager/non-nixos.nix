{ pkgs, libs, config, ... }:
let
  username = "astrid";
in
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
}

{ pkgs, libs, config, ... }: {
  home.username = "astrid";
  home.homeDirectory = "/home/${home.username}";
}

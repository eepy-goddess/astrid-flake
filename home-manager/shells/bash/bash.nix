{ config, lib, pkgs, ... }: {
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      # Environment variables
      export PATH="$PATH:/home/astrid/.cargo/bin"

      # Aliases
      alias la='ls -a'
    '';
  };
}

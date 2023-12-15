# Environment variables
export SXHKD_SHELL="bash"
export GPG_TTY=$(tty)

# Aliases
alias la='ls -a'
alias ll='ls -l'
alias sync-nixos='sudo nixos-rebuild switch --flake $(pwd)/../../../..#nyaaxOwOs'
alias update-nixos'nix flake update $(pwd)/../../../.. && sudo nixos-rebuild switch --flake $(pwd)/../../../..#nyaaxOwOs --upgrade'

# Shell jobs
(cat ~/.cache/wal/sequences &)

{pkgs, ...}:
pkgs.writeShellScriptBin "fnv" ''
  cd ~/.dotfiles
  fd -e nix | fzf --bind "enter:become(nvim {})"
''

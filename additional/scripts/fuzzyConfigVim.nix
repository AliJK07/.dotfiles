{pkgs, ...}:
pkgs.writeShellScriptBin "fcn" ''
  cd ~/.dotfiles/modules/home-manager/apps/neovim/
  fd | fzf --bind "enter:become(nvim {})"
''

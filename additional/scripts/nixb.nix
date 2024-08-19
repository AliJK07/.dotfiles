{pkgs}:
pkgs.writeShellScriptBin "nixb" ''
  cd ~/.dotfiles
  git add -A
  sudo nixos-rebuild switch --flake ~/.dotfiles/#pc
''

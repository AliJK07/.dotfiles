{pkgs, ...}:
pkgs.writeShellScriptBin "runGodot" ''
  kitty -e -T GodotVim nvim ~/godot-projects/Current/ --listen ~/.cache/nvim/godot.pipe &
  godot4 -f -e --path ~/godot-projects/Current
''

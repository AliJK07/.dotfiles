{pkgs, ...}:
pkgs.writeShellScriptBin "runGodotScene" ''
  hyprtcl dispatch workspace 6
  godot4 -f --path ~/godot-projects/Current
  hyprctl dispatch movetoworkspace 6
''

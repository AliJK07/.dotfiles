{pkgs, ...}:
pkgs.writeShellScriptBin "toggleScreen" ''

  TOGGLE=$HOME/.toggle

  if [ ! -e $TOGGLE ]; then
      touch $TOGGLE
      xrandr --output DP-4 --output HDMI-0 --off
      polybar-msg cmd toggle
  else
      rm $TOGGLE
      xrandr --output DP-4 --output HDMI-0 --right-of DP-4 --auto
      polybar-msg cmd toggle
  fi


''

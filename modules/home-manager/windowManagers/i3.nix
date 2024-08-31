{
  config,
  pkgs,
  input,
  lib,
  ...
}: {
  imports = [
    ../runner/rofi.nix
    ../bars/polybar.nix
  ];
  config = {
    home.packages = with pkgs; [
      dunst
    ];
    services = {
      picom.enable = true;
    };
    programs = {
      i3blocks = {
        enable = true;
        bars = {
          bottom = {
          };
        };
      };
    };
    xsession.windowManager.i3 = {
      enable = true;

      config = {
        gaps.inner = 5;
        modifier = "Mod4";
        startup = [
          {
            command = "polybarStart";
            always = true;
            notification = false;
          }
          {
            command = "firefox";
            always = false;
            notification = false;
          }
          {
            command = "picom -b";
            always = false;
            notification = false;
          }
          {
            command = "nitrogen --restore";
            always = false;
            notification = false;
          }
          {
            command = "nm-applet";
            always = false;
            notification = false;
          }
        ];
        bars = [];
        assigns = {
          "1" = [{class = "firefox";}];
          "3" = [{class = "steam";}];
          # "6" = [{title = ".*Godot_Engine$";}];
          # "5" = [{title = ".*\(Debug\)$";}];
          "7" = [{title = "^GodotVim$";}];
          "9" = [{title = ".*QEMU/KVM$";}];
          "8" = [{class = "Virt-manager";}];
        };
        floating.criteria = [
          {
            title = "Steam - Update News";
          }
          {
            title = "Friends List";
            class = "steam";
          }
          {
            class = "pavucontrol";
          }
        ];
        window = {
          titlebar = false;
        };
        fonts = {
          names = ["JetBrainsMono Nerd Font"];
          size = 14.0;
        };
        terminal = "kitty";
        keybindings = let
          mod = config.xsession.windowManager.i3.config.modifier;
        in
          lib.mkOptionDefault {
            "${mod}+m" = "exec --no-startup-id toggleScreen";
            "${mod}+s" = "exec --no-startup-id flameshot screen";
            "${mod}+g" = "exec --no-startup-id runGodot";
            "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status";
            "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status";
            "XF86MonBrightnessUp" = "exec --no-startup-id brightnessctl set +5%";
            "XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 5%-";
            "$Shift+Control+d" = "exec --no-startup-id shutdown now";
            "${mod}+Return" = "exec --no-startup-id kitty";
            "${mod}+q" = "kill";
            "${mod}+space" = "exec --no-startup-id rofi -show drun -show-icons";
            "${mod}+h" = "focus left";
            "${mod}+j" = "focus up";
            "${mod}+k" = "focus down";
            "${mod}+l" = "focus right";
            "${mod}+Shift+r" = "restart";
            "${mod}+b" = "exec --no-startup-id bluetoothctl connect DC:80:84:EF:5B:E1";
            "${mod}+Shift+s" = "exec --no-startup-id systemctl suspend";
          };
      };
      extraConfig = ''
        set $term kitty
        set $mod Mod4

        exec --no-startup-id i3-msg 'workspace "2"; exec $term zellij attach; workspace "1"'


        exec --no-startup-id $term --name term
        for_window [instance="term"] floating enable
        for_window [instance="term"] move scratchpad
        for_window [instance="term"] resize set 1500 900
        for_window [instance="term"] border pixel 5
        for_window [title=".*Godot Engine$"] move to workspace 5
        for_window [title=".*\(DEBUG\)$"] move to workspace 6
        bindsym $mod+n [instance="term"] scratchpad show; [instance="term"] move position center

      '';
    };
  };
}

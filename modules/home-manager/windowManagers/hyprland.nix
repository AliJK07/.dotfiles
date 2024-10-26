{
  pkgs,
  lib,
  config,
  nconfig,
  inputs,
  ...
}: let
  browser = "zen";
in {
  imports = [../runner/wofi.nix];

  config = {
    home.sessionVariables = {
      # WLR_RENDERER = "vulkan";
      # XDG_SESSION_TYPE = "wayland";
      # GTK_USE_PORTAL = "1";
      # NIXOS_XDG_OPEN_USE_PORTAL = "1";
      # NIXOS_OZONE_WL = 1;
      # MOZ_ENABLE_WAYLAND = 1;
    };

    # programs.swaylock = {
    # enable = true;
    # };

    home.packages = with pkgs; [
      wofi
      swww
      cliphist
      hyprshot
      dunst
      wl-clipboard
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # systemd.enable = true;

      settings = lib.mkOptionDefault {
        # env = ["NVD_BACKEND,direct" "LIBVA_DRIVER_NAME,nvidia" "XDG_SESSION_TYPE,wayland" "GBM_BACKEND,nvidia-drm" "__GLX_VENDOR_LIBRARY_NAME,nvidia"];
        windowrulev2 = [
          "workspace 3 silent,class:^(steam)$"
          "workspace 1 silent,class:^(zen-alpha)$"
          "rounding 0, noborder, class:(processing-core-PApplet)"
          "workspace 7 silent,class:(Godot),fullscreen:1"
          # "workspace 6,title:(Godot)"
        ];
        # xwayland = {
        # force_zero_scaling = true;
        # };
        exec-once = [
          "exec-once=systemctl --user start plasma-polkit-agent"
          # "swaylock"
          "swww init"
          "[workspace 1 silent] ${browser}"
          "histclip"
          "dunst"
        ];

        input = {
          kb_layout = "us,ara";
          kb_variant = "";
          kb_model = "";
          kb_options = "grp:alt_shift_toggle";
          kb_rules = "";

          follow_mouse = 1;

          accel_profile = "flat";

          touchpad.natural_scroll = "yes";

          sensitivity = 0; # -1.0 - 1.0, 0 means no modification.cccwwww
          #repeat_rate
          repeat_delay = 200;
        };
        general = {
          gaps_in = 5;
          gaps_out = 5;
          border_size = 2;

          "col.active_border" = "rgba(458588ee) rgba(b16286ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";
        };
        decoration = {
          rounding = 10;
          drop_shadow = "yes";
          shadow_range = 4;
          shadow_render_power = 3;
        };
        misc = {
          disable_hyprland_logo = true;
          # vrr = 1;
        };
        animations = {
          enabled = "yes";

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };
        dwindle = {
          pseudotile = "yes";
          preserve_split = "yes";
          force_split = 3;
        };
        # monitor = [
        #   "eDP-1,1920x1080@60,auto,1.25"
        # ];
        "$mainMod" = "SUPER";
        bind = [
          "$mainMod, p, exec, runGodotScene"
          "$mainMod, g, exec, runGodot"
          "$mainMod, b, exec, bluetoothctl connect DC:80:84:EF:5B:E1"
          "$mainMod, RETURN, exec, kitty"
          "$mainMod, Q, killactive"
          "$mainMod, F, fullscreen"
          "$mainMod SHIFT, M, exit"
          "$mainMod SHIFT, S, exec, systemctl suspend"
          "$mainMod, SPACE, exec, wofi --show drun"

          "$mainMod, 1, workspace, 1 "
          "$mainMod, 2, workspace, 2 "
          "$mainMod, 3, workspace, 3 "
          "$mainMod, 4, workspace, 4 "
          "$mainMod, 5, workspace, 5 "
          "$mainMod, 6, workspace, 6 "
          "$mainMod, 7, workspace, 7 "
          "$mainMod, 8, workspace, 8 "
          "$mainMod, 9, workspace, 9 "
          "$mainMod, 0, workspace, 10"

          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"

          "$mainMod, H, movefocus, l"
          "$mainMod, L, movefocus, r"
          "$mainMod, K, movefocus, u"
          "$mainMod, J, movefocus, d"
        ];
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
        monitor = [
          "DP-3,2560x1440@165,0x0,1"
          "HDMI-A-1,1920x1080@60,2560x210,1"
        ];
        workspace = [
          "1,monitor:DP-3"
          "2,monitor:DP-3"
          "3,monitor:DP-3"
          "4,monitor:DP-3"
          "5,monitor:DP-3"
          "6,monitor:HDMI-A-1"
          "7,monitor:HDMI-A-1"
          "8,monitor:HDMI-A-1"
          "9,monitor:HDMI-A-1"
          "10,monitor:HDMI-A-1"
        ];
      };
    };
  };
}

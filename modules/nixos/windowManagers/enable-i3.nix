{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.my.windowManager.i3.enable;
in {
  options.my.windowManager.i3.enable = lib.mkEnableOption "Enables i3 as window manager";
  config = lib.mkIf cfg {
    services = {
      displayManager.sddm = {
        enable = true;
        theme = "chili";
      };
      xserver = {
        enable = true;
        windowManager.i3 = {
          enable = true;
          extraPackages = with pkgs; [
            xclip
            dmenu
            i3status
            i3lock
            i3blocks
          ];
        };
      };
    };
    environment.systemPackages = [
      pkgs.sddm-chili-theme
    ];
  };
}

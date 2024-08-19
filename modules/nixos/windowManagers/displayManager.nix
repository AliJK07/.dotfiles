{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.my.windowManager.hyprland.enable;
in {
  services = {
    xserver = {
      enable = true;
    };
  };
}

{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  cfg = config.my.windowManager.hyprland.enable;
in {
  options.my.windowManager.hyprland.enable = lib.mkEnableOption "Enables hyprland as window manager";
  config = lib.mkIf cfg {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
    hardware.nvidia = {
      open = lib.mkForce true;
    };
    services = {
      xserver.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "chili";
      };
    };
    environment.systemPackages = [
      pkgs.sddm-chili-theme
    ];
  };
}

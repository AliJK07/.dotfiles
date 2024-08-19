{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  cfg = config.my.windowManager.hyprland.enable;
  pkgs-hyprland = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
in {
  options.my.windowManager.hyprland.enable = lib.mkEnableOption "Enables hyprland as window manager";
  config = lib.mkIf cfg {
    programs.hyprland = {
      enable = true;
      package = pkgs-hyprland;
      xwayland.enable = true;
    };
  };
}

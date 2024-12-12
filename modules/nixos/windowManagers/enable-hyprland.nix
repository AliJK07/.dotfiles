{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  cfg = config.my.windowManager.hyprland.enable;
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [
    # ./wayland.nix
  ];

  options.my.windowManager.hyprland.enable = lib.mkEnableOption "Enables hyprland as window manager";
  config = lib.mkIf cfg {
    services = {
      xserver.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        # theme = "chili";
      };
    };
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };
  };
}

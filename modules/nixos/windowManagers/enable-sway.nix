{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  cfg = config.my.windowManager.sway.enable;
in {
  options.my.windowManager.sway.enable = lib.mkEnableOption "Enables sway as window manager";
  config = lib.mkIf cfg {
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
          user = "greeter";
        };
      };
    };
  };
}

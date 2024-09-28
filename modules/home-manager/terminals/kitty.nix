{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.kitty = {
    enable = true;
    settings = {
      shell = "fish";
      copy_on_select = true;
      background_opacity = "0.90";
      enable_audio_bell = false;
      allow_remote_control = true;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };
    themeFile = "tokyo_night_night";
  };
}

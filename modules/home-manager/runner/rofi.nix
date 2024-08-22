{...}: {
  programs.rofi = {
    enable = true;
    theme = ./launchpad.rasi;
    font = "JetBrainsMono Nerd Font 14";
  };
  # home.file.".config/rofi" = {
  # source = ./configs;
  # recursive = true;
  # };
}

{
  config,
  pkgs,
  lib,
  ...
}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      ubuntu_font_family
      liberation_ttf
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
      source-han-sans-japanese
      source-han-serif-japanese
      corefonts
      vistafonts
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Liberation Serif"];
        sansSerif = ["Ubuntu"];
        monospace = ["Ubuntu Mono"];
      };
    };
  };
}

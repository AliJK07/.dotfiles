{
  pkgs,
  config,
  ...
}: let
  suru = import ./../../../pkgs/suru {inherit pkgs;};
in {
  gtk = {
    enable = true;
    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";
    font = {
      size = 12;
      name = "JetBrainsMono Nerd Font";
    };
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark"; # to get name build with nix build nixpkgs#<pkgname> to see name of pkg
    };
    iconTheme = {
      package = suru;
      name = "Suru++";
    };
  };
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    x11.enable = true;
  };
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
  home.packages = with pkgs; [
    lxappearance
    #   sassc
    #   gtk-engine-murrine
    #   gnome.gnome-themes-extra
  ];
}

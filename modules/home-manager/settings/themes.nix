{
  pkgs,
  config,
  ...
}: let
  suru = import ./../../../pkgs/suru {inherit pkgs;};
in {
  gtk = {
    enable = true;
    cursorTheme.package = pkgs.vimix-cursors;
    cursorTheme.name = "Vimix-cursors";
    cursorTheme.size = 24;
    font = {
      size = 12;
      name = "JetBrainsMono Nerd Font";
    };
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark"; # to get name build with nix build nixpkgs#<pkgname> to see name of pkg
    };
    # iconTheme = {
    #   package = suru;
    #   name = "Suru++";
    # };
  };
  home.pointerCursor = {
    name = "Vimix-cursors";
    package = pkgs.vimix-cursors;
    x11.enable = true;
  };
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
  home.sessionVariables = {
    HYPRCURSOR_THEME = "Vimix-cursors";
    HYPRCURSOR_SIZE = "24";
  };
  home.packages = with pkgs; [
    xorg.xcursorgen
    lxappearance
    #   sassc
    #   gtk-engine-murrine
    #   gnome.gnome-themes-extra
  ];
}

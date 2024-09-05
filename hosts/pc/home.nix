{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/home-manager/terminals/kitty.nix
    ../../modules/home-manager/windowManagers/i3.nix
    # ../../modules/home-manager/windowManagers/hyprland.nix
    ../../modules/home-manager/shells
    ../../modules/home-manager/apps/neovim/neovim.nix
    ../../modules/home-manager/apps/bitwarden.nix
    ../../modules/home-manager/apps/firefox.nix
    ../../modules/home-manager/apps/git.nix
    ../../modules/home-manager/apps/retroarch.nix
    ../../modules/home-manager/settings/i3-2screens.nix
    ../../modules/home-manager/settings/themes.nix
    # ../../modules/home-manager/apps/librewolf.nix
    ../../additional/scripts
  ];

  services = {
    flameshot.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  home.username = "ali";
  home.homeDirectory = "/home/ali";

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
    autotiling
    inputs.zen-browser.packages."${system}".specific
    w3m
    ueberzugpp
    ytfzf
    pipe-viewer
    distrobox
    xdotool
    lutris
    maim
    cool-retro-term
    vesktop
    nix-init
    libreoffice
    prismlauncher
    bc
    obsidian
    gitleaks
    libnotify
    nurl
    godot_4
    nautilus
    bat
    eza
    mpv
  ];

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}

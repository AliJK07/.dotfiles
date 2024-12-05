{
  config,
  pkgs,
  inputs,
  ...
}: let
  rtpmidid = pkgs.callPackage ../../pkgs/rtpmidid {};
in {
  imports = [
    ../../modules/home-manager/terminals/kitty.nix
    # ../../modules/home-manager/windowManagers/i3.nix
    ../../modules/home-manager/windowManagers/hyprland.nix
    # ../../modules/home-manager/windowManagers/sway.nix
    ../../modules/home-manager/shells
    ../../modules/home-manager/apps/neovim/neovim.nix
    # ../../modules/home-manager/apps/neovim/nixvim.nix
    ../../modules/home-manager/apps/bitwarden.nix
    ../../modules/home-manager/apps/firefox.nix
    # ../../modules/home-manager/apps/qutebrowser.nix
    ../../modules/home-manager/apps/git.nix
    ../../modules/home-manager/apps/retroarch.nix
    # ../../modules/home-manager/settings/i3-2screens.nix
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

  # home-manager.backupFileExtension = "backup";

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
  programs.bashmount.enable = true;

  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
    pcsx2
    autotiling
    inputs.zen-browser.packages."${system}".specific
    git-credential-manager
    w3m
    ncpamixer
    zoom-us
    komikku
    inkscape
    protontricks
    unrar
    bottles
    ardour
    usbutils
    rtpmidid
    barrier
    touchosc
    qmidinet
    vcv-rack
    grim
    mars-mips
    dualsensectl
    pomodoro-gtk
    brave
    protonup-qt
    filezilla
    xdelta
    waypaper
    steam-rom-manager
    thunderbird
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

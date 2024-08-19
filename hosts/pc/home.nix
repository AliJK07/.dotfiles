{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/home-manager/terminals/kitty.nix
    ../../modules/home-manager/windowManagers/i3.nix
    ../../modules/home-manager/windowManagers/hyprland.nix
    ../../modules/home-manager/shells
    ../../modules/home-manager/apps/neovim/neovim.nix
    ../../modules/home-manager/apps/bitwarden.nix
    ../../modules/home-manager/apps/retroarch.nix
    ../../modules/home-manager/settings/i3-2screens.nix
    ../../modules/home-manager/settings/themes.nix
    ../../modules/home-manager/apps/librewolf.nix
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
    # (python3.withPackages (ps: with ps; [pip cython python-osc python-rtmidi]))
    # (python3Packages.callPackage ../../pkgs/touchosc2midi {})
    nix-init
    vcv-rack
    dotnet-runtime
    komikku
    ark
    libreoffice
    prismlauncher
    kdePackages.okular
    bc
    galculator
    vinegar
    cool-retro-term
    minetest
    pureref
    obsidian
    filezilla
    protonup-qt
    protonup
    gitleaks
    libnotify
    solaar
    youtube-tui
    vesktop
    evtest
    xboxdrv
    pcsx2
    pkg-config
    ninja
    cmake
    gnumake
    nurl
    xautoclick
    netbeans
    godot_4
    nautilus
    manga-cli
    grapejuice
    the-powder-toy
    glfw
    glslviewer
    bat
    eza
    # rpcs3
    ranger
    ani-cli
    anime-downloader
    sc-controller
    imgui
    mpv
  ];

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}

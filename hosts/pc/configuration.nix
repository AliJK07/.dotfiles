# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  pkgs-stable,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ../../modules/nixos/drivers/nvidia.nix
    ../../modules/nixos/virtualization/libvirt.nix
    ../../modules/nixos/virtualization/podman.nix
    ../../modules/nixos/drivers/audio.nix
    ../../modules/nixos/drivers/zsa.nix
    ../../modules/nixos/drivers/duelsense.nix
    ../../modules/nixos/systemd/tmux.nix
    ../../modules/nixos/apps/steam.nix
    # ../../modules/nixos/apps/git.nix
    ../../modules/nixos/settings/fonts.nix
    ../../modules/nixos/settings/screen.nix
    ../../modules/nixos/windowManagers/default.nix
    ./hardware-configuration.nix
    # inputs.home-manager.nixosModules.default
    inputs.sops-nix.nixosModules.sops
  ];

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };

  programs.nh = {
    enable = true;
  };
  environment.sessionVariables = {
    FLAKE = "$HOME/.dotfiles";
  };

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/ali/.config/sops/age/keys.txt";

    secrets.email = {};
  };
  services.fail2ban.enable = true;
  networking.firewall.enable = true;

  # my.windowManager.hyprland.enable = true;
  my.windowManager.i3.enable = true;
  # configuration.nix
  boot.loader.systemd-boot.configurationLimit = 10;
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      substituters = ["https://nix-gaming.cachix.org" "https://hyprland.cachix.org"];
      trusted-substituters = ["https://cache.garnix.io"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="];
    };
  };

  xdg.mime = {
    enable = true;
    addedAssociations = {
      "application/pdf" = ["org.kde.okular.desktop"];
    };
    defaultApplications = {
      "application/pdf" = ["org.kde.okular.desktop"];
    };
  };
  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUsePortal = true;
  security.polkit = {
    enable = true;
  };
  # powerManagement.cpuFreqGovernor = lib.mkForce "performance";

  environment.sessionVariables = {
    # WLR_NO_HARDWARE_CURSORS = "1";
    # NIXOS_OZONE_WL = "1";
  };

  users.extraUsers.ali.extraGroups = ["jackaudio" "gamemode"];

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pc"; # Define your hostname.

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services = {
    # avahi.enable = true;
    udev.enable = true;
    ratbagd.enable = true;
    picom.enable = true;
    # xserver.enable = true;
    pipewire.wireplumber.enable = true;
    flatpak.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
    };
  };
  programs = {
    gnome-disks.enable = true;
    java.enable = true;
    dconf.enable = true;
    gamemode.enable = true;
    weylus = {
      enable = true;
      users = ["ali"];
      openFirewall = true;
    };
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # environmental variables
  environment.variables.EDITOR = "nvim";
  environment.pathsToLink = ["/libexec"];

  hardware = {
    cpu.intel.updateMicrocode = true;
    keyboard.zsa.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Riyadh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_SA.UTF-8";
    LC_IDENTIFICATION = "ar_SA.UTF-8";
    LC_MEASUREMENT = "ar_SA.UTF-8";
    LC_MONETARY = "ar_SA.UTF-8";
    LC_NAME = "ar_SA.UTF-8";
    LC_NUMERIC = "ar_SA.UTF-8";
    LC_PAPER = "ar_SA.UTF-8";
    LC_TELEPHONE = "ar_SA.UTF-8";
    LC_TIME = "ar_SA.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us, ara";
    variant = "";
    options = "grp:alt_shift_toggle";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    groups = {
      plugdev = {};
    };
    users.ali = {
      isNormalUser = true;
      description = "Ali";
      extraGroups = ["networkmanager" "wheel" "plugdev"];
      packages = with pkgs; [];
    };
  };

  # home-manager = {
  #   # also pass inputs to home-manager modules
  #   extraSpecialArgs = {
  #     inherit inputs;
  #     nconfig = config;
  #   };
  #   users = {
  #     "ali" = import ./home.nix;
  #   };
  #   backupFileExtension = "backup";
  # };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    # inputs.helix.packages."${pkgs.system}".helix
    polkit-kde-agent
    nix-prefetch-github
    sops
    nix-template
    microcodeIntel
    apvlv
    killall
    unzip
    p7zip
    qbittorrent
    home-manager
    volantes-cursors
    nitrogen
    feh
    neovim
    wget
    kitty
    alacritty
    pavucontrol
    tldr
    lazygit
    xclip
    btop
    piper
    wally-cli
    nix-inspect
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}

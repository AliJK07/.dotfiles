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
    ./hardware-configuration.nix
    # ../../modules/nixos/windowManagers/enable-i3.nix
    ../../modules/nixos/windowManagers/enable-hyprland.nix
    ../../modules/nixos/drivers/bluetooth.nix
    ../../modules/nixos/drivers/audio.nix
    ../../modules/home-manager/apps/steam.nix

    inputs.home-manager.nixosModules.default
  ];

  xdg.mime.defaultApplications = {
    "application/pdf" = "YACReader.desktop";
  };

  hardware = {
    cpu.amd.updateMicrocode = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = [pkgs.mesa.drivers];
    };
  };

  programs = {
    wireshark.enable = true;
    java.enable = true;
    weylus = {
      enable = true;
      openFirewall = true;
    };
  };

  # powerManagement = {
  #   enable = true;
  #   powertop.enable = true;
  # };
  services = {
    # thermald.enable = true;
    # tlp.enable = true;
    gnome.gnome-keyring.enable = true;
    mysql = {
      enable = true;
      package = pkgs.mysql;
    };
    atuin.enable = true;
    mpd.enable = true;
    usbmuxd.enable = true;
    keyd = {
      enable = true;
      keyboards.default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(control, esc)";
          };
        };
      };
    };
  };
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    experimental-features = ["nix-command" "flakes"];
  };

  programs.nm-applet.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "nixos"; # Define your hostname.

  programs = {
    dconf.enable = true;
    gamemode.enable = true;
    # gamescope.enable = true;
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # environmental variables
  environment.pathsToLink = ["/libexec"];

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
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ali = {
    isNormalUser = true;
    description = "Ali";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "ali" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages =
    (with pkgs; [
      yacreader
      foliate
      discord
      mysql-workbench
      # ciscoPacketTracer8
      wireshark
      acpi
      xclip
      networkmanagerapplet
      killall
      steam
      appimage-run
      unzip
      p7zip
      qbittorrent
      home-manager
      volantes-cursors
      nitrogen
      feh
      neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      kitty
      alacritty
      fish
      git
      firefox
      starship
      stow
      pavucontrol
      tldr
      lazygit
      xfce.thunar
      thunderbird
      btop
      gamemode
      mangohud
      goverlay
      piper
    ])
    ++ (with pkgs-stable; [
      cemu
    ]);

  fonts.packages = with pkgs; [
    #(nerdfonts.override { fonts = [ "JetBrainsMono" "DroidSansMono" ]; })
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
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

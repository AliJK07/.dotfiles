{
  lib,
  config,
  pkgs,
  ...
}: {
  #boot.initrd.kernelModules = ["nvidia" "nvidia_uvm" "nvidia_modeset" "snd_hda_intel" "uinput"];
  #powerManagement.cpuFreqGovernor = lib.mkForce "performance";
  #boot.kernelParams = ["intel_pstate=disable" "processor.max_cstate=1"];
  # boot.kernelModules = ["nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia" "glaxnimate"];
  # boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "nvme" "sd_mod" "sr_mod"];
  # boot.kernelParams = ["nvidia-drm.modeset=1"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      open = false;
      # powerManagement.enable = true;
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
  services.xserver.videoDrivers = ["nvidia"];

  environment.systemPackages = with pkgs; [
    # nvidia-vaapi-driver
    # vulkan-loader
    # vulkan-tools
    # linuxKernel.packages.linux_xanmod.nvidia_x11_vulkan_beta
  ];
}

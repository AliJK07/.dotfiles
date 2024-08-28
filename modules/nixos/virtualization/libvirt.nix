{
  config,
  pkgs,
  ...
}: {
  programs.dconf.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.ali.extraGroups = ["libvirtd"];
  environment.systemPackages = with pkgs; [
    libvirt-glib
    qemu_kvm
    virtiofsd
  ];
}

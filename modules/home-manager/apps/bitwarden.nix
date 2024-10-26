{pkgs, ...}: {
  home.packages = with pkgs; [
    # bitwarden
    pinentry
    rbw
  ];
}

{pkgs, ...}: {
  home.packages = with pkgs; [
    retroarch-full
    # retroarch.withCores (cores: [ ... ])
  ];
}

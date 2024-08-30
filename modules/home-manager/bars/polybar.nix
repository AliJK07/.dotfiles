{pkgs, ...}: {
  services.polybar = {
    enable = true;
    config = ./config.ini;
    script = "";
    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };
  };
}

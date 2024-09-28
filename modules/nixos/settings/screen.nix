{...}: {
  services.xserver.xrandrHeads = [
    {
      output = "DP-4";
      primary = true;
      monitorConfig = ''
        Option "DPMS" "false"
      '';
    }

    {
      output = "HDMI-0";
    }
  ];
}

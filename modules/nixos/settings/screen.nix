{...}: {
  services.xserver.xrandrHeads = [
    {
      output = "DP-4";
      primary = true;
    }

    {
      output = "HDMI-0";
    }
  ];
}

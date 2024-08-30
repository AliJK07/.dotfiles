{...}: {
  xsession.windowManager.i3.config.workspaceOutputAssign = let
    mon1 = "DP-4";
    mon2 = "HDMI-0";
  in [
    {
      output = mon1;
      workspace = "1";
    }
    {
      output = mon1;
      workspace = "2";
    }
    {
      output = mon1;
      workspace = "3";
    }
    {
      output = mon1;
      workspace = "4";
    }
    {
      output = mon1;
      workspace = "5";
    }
    {
      output = mon2;
      workspace = "6";
    }
    {
      output = mon2;
      workspace = "7";
    }
    {
      output = mon2;
      workspace = "8";
    }
    {
      output = mon2;
      workspace = "9";
    }
    {
      output = mon2;
      workspace = "10";
    }
  ];
}

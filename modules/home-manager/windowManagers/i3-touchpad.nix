{...}: {
  xsession.windowManager.i3.config.startup = [
    {
      command = "xinput set-prop 'ELAN1301:00 04F3:3128 Touchpad'  'libinput Tapping Enabled' 1";
      notification = false;
    }
    {
      command = "xinput set-prop 'ELAN1301:00 04F3:3128 Touchpad'  'libinput Natural Scrolling Enabled' 1
";
      notification = false;
    }
  ];
}

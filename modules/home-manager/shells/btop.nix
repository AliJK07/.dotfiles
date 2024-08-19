{lib, ...}: {
  programs = {
    btop = {
      enable = true;
      settings = {
        color_theme = lib.mkDefault "tokyo-night";
        proc_tree = true;
      };
    };
  };
}

{pkgs, ...}: {
  home.packages = with pkgs; [
  ];

  programs.zellij = {
    enable = true;
    # enableFishIntegration = true;
    settings = {
      default_shell = "fish";
    };
  };
}

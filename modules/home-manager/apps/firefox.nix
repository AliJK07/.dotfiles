{...}: {
  programs.firefox = {
    enable = true;
    profiles = {
      "secondary" = {
        name = "secondary";
      };
    };
  };
}

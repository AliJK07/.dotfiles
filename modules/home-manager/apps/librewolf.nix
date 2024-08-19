{...}: {
  programs.librewolf = {
    enable = true;
    settings = {
      # "privacy.resistFingerprinting.letterboxing" = true;
      "browser.compactmode.show" = true;
    };
  };
}

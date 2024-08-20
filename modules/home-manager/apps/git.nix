{pkgs, ...}: {
  programs.git = {
    enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      url = {
        "https://github.com/" = {
          insteadOf = [
            "gh:"
            "github:"
          ];
        };
      };
      credential.helper = "${
        pkgs.git.override {withLibsecret = true;}
      }/bin/git-credential-libsecret";
    };
    userName = "ali";
    userEmail = "example@email.com";
  };
}

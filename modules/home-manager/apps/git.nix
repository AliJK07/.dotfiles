{pkgs, ...}: {
  # home.file = {
  # ".gitconfig".text = ''
  #   [user]
  #   	email = example@email.com
  #   	name = ali
  #   [credential]
  #   	helper = store
  #   [init]
  #   	defaultBranch = main
  #   [filter "lfs"]
  #   	clean = git-lfs clean -- %f
  #   	smudge = git-lfs smudge -- %f
  #   	process = git-lfs filter-process
  #   	required = true
  # '';
  # };
  programs = {
    git = {
      enable = true;
      userName = "ali";
      userEmail = "ali@mail.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        credential = {
          helper = "store";
        };
      };
    };
  };
  #     url = {
  #       "https://github.com/" = {
  #         insteadOf = [
  #           "gh:"
  #           "github:"
  #         ];
  #       };
  #     };
  #     credential.helper = "${
  #       pkgs.git.override {withLibsecret = true;}
  #     }/bin/git-credential-libsecret";
  #   };
  #   userName = "ali";
  #   userEmail = "example@email.com";
  # };
}

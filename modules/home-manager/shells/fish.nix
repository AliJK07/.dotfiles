{pkgs, ...}: {
  home.packages = with pkgs; [
    eza
  ];
  programs = {
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
  };
  programs.fish = {
    enable = true;
    plugins = [
      # {
      #   name = "z";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "jethrokuan";
      #     repo = "z";
      #     rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
      #     sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
      #   };
      # }
    ];
    shellInit = ''
      if status is-interactive
          # Commands to run in interactive sessions can go here
      end
      fish_vi_key_bindings
      # bind --erase \cr
      set -U fish_greeting
    '';
    shellAliases = {
      ll = "eza -l --icons=always -agh --git";
      l = "eza  --icons=always -agh --git";
      cat = "bat";
      gd = "nvim --listen ~/.cache/nvim/godot.pipe .";
      dotl = "lazygit -p ~/.dotfiles";
      fu = "nix flake update ~/.dotfiles";
    };
  };
}

{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs.vscode-extensions; [
    # asvetliakov.vscode-neovim
  ];
  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    userSettings = {
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
    };
    extensions =
      (with pkgs.vscode-extensions; [
        asvetliakov.vscode-neovim
      ])
      ++ [
        inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace."tobiah"."language-pde"
      ];
  };
}

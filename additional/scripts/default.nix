{pkgs, ...}: {
  home.packages = [
    (import ./runNvimGodot.nix {inherit pkgs;})
    (import ./nixb.nix {inherit pkgs;})
    (import ./fuzzyNixFiles.nix {inherit pkgs;})
    (import ./fuzzyConfigVim.nix {inherit pkgs;})
    (import ./runGodot.nix {inherit pkgs;})
    (import ./runGodotScene.nix {inherit pkgs;})
    (import ./toggleScreen.nix {inherit pkgs;})
  ];
}

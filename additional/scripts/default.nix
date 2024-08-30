{pkgs, ...}: {
  home.packages = [
    (import ./runNvimGodot.nix {inherit pkgs;})
    (import ./nixb.nix {inherit pkgs;})
    (import ./fuzzyNixFiles.nix {inherit pkgs;})
    (pkgs.callPackage ./fuzzyConfigVim.nix {})
    (import ./runGodot.nix {inherit pkgs;})
    (import ./runGodotScene.nix {inherit pkgs;})
    (import ./toggleScreen.nix {inherit pkgs;})
    (import ./polybarStart.nix {inherit pkgs;})
  ];
}

{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  name = "suru++";

  src = pkgs.fetchurl {
    url = "https://github.com/gusbemacbe/suru-plus/archive/refs/tags/v30.0.zip";
    sha256 = "0m1jiln7l4i20hpxv5s2l4vi64yrm1s8whrv0vn89j5jch1k2dvx";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    ${pkgs.unzip}/bin/unzip $src
    cp -r ./suru-plus-30.0/Suru++ $out/share/icons
  '';
}

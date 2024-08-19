# {pkgs ? import <nixpkgs> {}}:
{
  stdenv,
  fetchurl,
  unzip,
}:
stdenv.mkDerivation rec {
  pname = "glsl_analyzer";
  version = "1.0";

  src = fetchurl {
    url = "https://github.com/nolanderc/glsl_analyzer/releases/download/v1.4.4/x86_64-linux-musl.zip";
    sha256 = "sha256-+laskHvnpO3IzPQ1VP0m1fa8/5dr0/tatUrh42aUUGA=";
  };

  buildInputs = [unzip];

  installPhase = ''
    mkdir -p $out/bin
    cp glsl_analyzer $out/bin
  '';
}

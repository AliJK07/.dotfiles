{
  stdenv,
  fetchFromGitHub,
  cmake,
  qt5,
  lib,
  libsForQt5,
  pkg-config,
  avahi,
  fmt,
  alsaLib,
  # licenses,
}:
stdenv.mkDerivation rec {
  pname = "rtpmidid";
  version = "23.12";

  src = fetchFromGitHub {
    owner = "davidmoreno";
    repo = "rtpmidid";
    rev = "v${version}";
    sha256 = "sha256-PjPCtWtlO99TerPHr0fhne/vc8qsYJj2t/MFtyj2pQM=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    libsForQt5.qt5.wrapQtAppsHook
  ];
  buildInputs = [
    alsaLib
    qt5.qtbase
    qt5.qtmultimedia
    avahi
    fmt
  ];
  # NIX_CFLAGS_COMPILE = ["-std=c++11"];
  # cmakeFlags = [
  #   "-DCMAKE_INSTALL_PREFIX=$out"
  # ];
  # Disable default installPhase and glib hooks
  # Provide a custom installPhase
  installPhase = ''
    mkdir -p $out/bin
    cp -v src/rtpmidid $out/bin/
  '';
  # installPhase = ''
  #   mkdir -p $out/bin
  #   cp -v build/src/rtpmidid $out/bin/
  #   # cp -v src/rtpmidid2-daemon $out/bin/
  # '';

  meta = with lib; {
    description = "An RTP-MIDI daemon for Linux";
    homepage = "https://github.com/davidmoreno/rtpmidid";
    license = licenses.gpl3Plus;
    maintainers = [];
    platforms = platforms.linux;
  };
}

{pkgs, ...}: {
  home.packages = with pkgs; [
    (retroarch.override {
      cores = with libretro; [
        fceumm
        genesis-plus-gx
        snes9x
        beetle-psx-hw
        mupen64plus
        parallel-n64
        thepowdertoy
        pcsx2
        nestopia
      ];
    })
  ];
}

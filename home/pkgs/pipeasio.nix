{ pkgs, ... }:
let
  pipeasio = pkgs.stdenv.mkDerivation {
    pname = "pipeasio";
    version = "1.7.0";

    src = pkgs.fetchFromGitHub {
      owner = "M0n7y5";
      repo = "pipeasio";
      rev = "v1.7.0";
      hash = "sha256-L7EkqebKAgVtTWFDOH3b0emFE/3Esex8T0xtbOXjNgE=";
    };

    nativeBuildInputs = with pkgs; [
      cmake
      ninja
      gcc
      pkg-config
      wineWow64Packages.staging
      pkgsCross.mingwW64.buildPackages.gcc
    ];

    buildInputs = with pkgs; [
      pipewire
      qt6.qtbase
    ];

    cmakeFlags = [
      "-DCMAKE_C_COMPILER=${pkgs.gcc}/bin/gcc"
      "-DCMAKE_CXX_COMPILER=${pkgs.gcc}/bin/g++"
      "-DBUILD_TESTS=OFF"
      "-DBUILD_SETTINGS_PANEL=OFF"
    ];

    dontWrapQtApps = true;
  };
in
{
  home.file = {
    ".local/lib/wine".source = "${pipeasio}/lib/wine";
    ".local/bin/pipeasio-register".source = "${pipeasio}/bin/pipeasio-register";
    ".local/bin/pipeasio-settings".source = "${pipeasio}/bin/pipeasio-settings";
  };
}

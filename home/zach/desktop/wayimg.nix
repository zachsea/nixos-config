{ pkgs, lib, ... }:
let
  imageTypes = [
    "image/bmp"
    "image/gif"
    "image/jpeg"
    "image/png"
    "image/webp"
    "image/avif"
    "image/jxl"
    "image/tiff"
    "image/qoi"
    "image/x-qoi"
    "image/x-tga"
    "image/x-xcf"
    "image/x-xpixmap"
    "image/x-ilbm"
    "image/x-iff"
    "image/vnd.zbrush.pcx"
    "image/x-pcx"
    "image/x-portable-anymap"
    "image/x-portable-pixmap"
    "image/x-portable-graymap"
    "image/x-portable-bitmap"
    # "image/svg+xml"  # left out: SDL3_image's SVG support is basic
  ];
in
{
  home.packages = [ pkgs.wayimg ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = lib.genAttrs imageTypes (_: "cafe.zach.wayimg.desktop");
  };
}

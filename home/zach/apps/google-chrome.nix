{ pkgs, lib, ... }:
let
  webTypes = [
    "text/html"
    "application/xhtml+xml"
    "x-scheme-handler/http"
    "x-scheme-handler/https"
    "x-scheme-handler/about"
    "x-scheme-handler/unknown"
  ];
in
{
  home.packages = with pkgs; [
    google-chrome
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = lib.genAttrs webTypes (_: "google-chrome.desktop");
  };
}

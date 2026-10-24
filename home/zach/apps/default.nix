{ lib, ... }:
let
  webTypes = [
    "text/html"
    "application/xhtml+xml"
    "x-scheme-handler/http"
    "x-scheme-handler/https"
    "x-scheme-handler/about"
    "x-scheme-handler/unknown"
  ];

  archiveTypes = [
    "application/zip"
    "application/x-tar"
    "application/x-bzip2"
    "application/x-gzip"
    "application/x-7z-compressed"
    "application/x-rar"
  ];
in
{
  imports = [
    ./aseprite.nix
    ./chatterino7.nix
    ./discord.nix
    ./flatpak.nix
    ./fooyin.nix
    ./ghidra.nix
    ./google-chrome.nix
    ./kde.nix
    ./libreoffice.nix
    ./mangohud.nix
    ./mpv.nix
    ./obs.nix
    ./obsidian.nix
    ./osu-lazer.nix
    ./polychromatic.nix
    ./prismlauncher.nix
    ./reaper.nix
    ./spotify.nix
    ./vlc.nix
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications =
      (lib.genAttrs webTypes (_: "google-chrome.desktop"))
      // (lib.genAttrs archiveTypes (_: "org.kde.ark.desktop"));
  };
}

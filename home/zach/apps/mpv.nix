{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      vo = "gpu-next";
      gpu-context = "auto";
      profile = "high-quality";
      hwdec = "auto-safe";

      sub-auto = "fuzzy";
      # sub-font = "Sans";
      sub-font-size = 36;

      keep-open = "yes";
      save-position-on-quit = "yes";
      cursor-autohide = 1000;

      slang = "eng,en";
      alang = "jpn,jp,eng,en";
    };

    bindings = {
      "WHEEL_UP" = "seek 10";
      "WHEEL_DOWN" = "seek -10";
      "UP" = "add volume 2";
      "DOWN" = "add volume -2";
    };

    scripts = [
      pkgs.mpvScripts.mpris
      pkgs.mpvScripts.thumbfast
      pkgs.mpvScripts.uosc
    ];
  };
}

{ lib, config, ... }:
{
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
    settings = {
      tray = {
        enabled = false;
      };
      close_on_focus_loss = true;
      theme = "tokyo-night";
    };
    themes = {
      tokyo-night = {
        name = "Tokyo Night";
        appearance = "dark";
        colors = {
          background = "#1a1b26";
          foreground = "#c0caf5";
          accent = "#7aa2f7";
          selection = "#283457";
          comment = "#565f89";
          border = "#3b4261";
        };
      };
    };
    extensions = [
      (config.lib.vicinae.mkRayCastExtension {
        name = "nightscout";
        rev = "46d507a41722a4db3b6b7d3f4a326089a106f5a2";
        sha256 = "sha256-5+YRRIrLDwoQbUY4k1GMdOsNoXfjET910SBVp1QsUr0=";
        npmDepsHash = "sha256-Lm6SzeyIHlAc66QpSS4+Wg81+El+22OyfpG6jYZGUrc=";
      })
    ];
  };
}

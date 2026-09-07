{ lib, config, osConfig, ... }:
{
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
    settings = {
      "$schema" = "https://vicinae.com/schemas/config.json";
      imports = [ osConfig.sops.templates."vicinae-secrets.json".path];
      tray = {
        enabled = false;
      };
      close_on_focus_loss = true;
      theme = {
        dark = {
          name = "tokyo-night";
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

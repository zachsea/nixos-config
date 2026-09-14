{ lib, ... }:
{
  programs.quickshell = {
    enable = true;
    configs.default = lib.fileset.toSource {
      root = ./.;
      fileset = lib.fileset.difference ./. ./default.nix;
    };
    activeConfig = "default";
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };
}

# binds currently live in ./hotkeys.nix
{ pkgs, lib, ... }:
{
  # temp
  home.packages = [ pkgs.pwvucontrol ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    configType = "lua";
    systemd.enable = true;
    systemd.variables = [ "--all" ];

    settings = {
      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function()
              hl.exec_cmd("${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1")
            end
          '')
        ];
      };
      monitor = [
        {
          output = "DP-1";
          mode = "1920x1080@279.86";
          position = "1920x0";
          scale = 1;
          vrr = 1;
        }
        {
          output = "DP-3";
          mode = "1920x1080@239.76";
          position = "0x0";
          scale = 1;
          vrr = 1;
        }
      ];
    };
  };

  services.mako.enable = true; # likely replace
  services.hyprpaper.enable = true;
}

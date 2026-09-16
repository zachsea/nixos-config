# binds currently live in ./hotkeys.nix
{ pkgs, lib, ... }:
{
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
              hl.exec_cmd("noctalia-shell")
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

      workspace_rule = [
        {
          workspace = "1";
          monitor = "DP-1";
          persistent = true;
        }
        {
          workspace = "2";
          monitor = "DP-1";
          persistent = true;
        }
        {
          workspace = "3";
          monitor = "DP-1";
          persistent = true;
        }
        {
          workspace = "4";
          monitor = "DP-1";
          persistent = true;
        }
        {
          workspace = "5";
          monitor = "DP-1";
          persistent = true;
        }
        {
          workspace = "6";
          monitor = "DP-1";
          persistent = true;
        }
        {
          workspace = "7";
          monitor = "DP-1";
          persistent = true;
        }
        {
          workspace = "8";
          monitor = "DP-3";
          persistent = true;
        }
        {
          workspace = "9";
          monitor = "DP-3";
          persistent = true;
        }
        {
          workspace = "10";
          monitor = "DP-3";
          persistent = true;
        }
      ];

      layer_rule = [
        {
          name = "noctalia";
          match = {
            namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$";
          };
          no_anim = true;
          ignore_alpha = 0.5;
          blur = true;
          blur_popups = true;
        }
      ];

      window_rule = [
        {
          match = {
            class = "dev.noctalia.Noctalia";
          };
          float = true;
          size = lib.generators.mkLuaInline "{ 1080, 920 }";
        }
      ];

      config = {
        input = {
          accel_profile = "flat";
          force_no_accel = true;
        };

        general = {
          gaps_in = 5;
          gaps_out = 10;
        };

        decoration = {
          rounding = 20;
          rounding_power = 2;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = lib.generators.mkLuaInline "0xee1a1a1a";
          };

          blur = {
            enabled = true;
            size = 3;
            passes = 2;
            vibrancy = 0.1696;
          };
        };
      };
    };
  };
}

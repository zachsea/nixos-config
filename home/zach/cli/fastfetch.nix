{
  config,
  lib,
  ...
}:
let
  c = config.lib.stylix.colors;

  rgb = slot: "38;2;${c."${slot}-rgb-r"};${c."${slot}-rgb-g"};${c."${slot}-rgb-b"}";

  accent = rgb "base0E";
  text = rgb "base05";
  dim = rgb "base03";

  glyph =
    code:
    let
      n = lib.fromHexString code;
      v = n - 65536;
      hi = lib.toHexString (55296 + builtins.div v 1024);
      lo = lib.toHexString (56320 + lib.mod v 1024);
    in
    if n < 65536 then builtins.fromJSON ''"\u${code}"'' else builtins.fromJSON ''"\u${hi}\u${lo}"'';

  mod =
    type: icon: extra:
    {
      inherit type;
      key = glyph icon;
    }
    // extra;
in
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-direct";
        source = ../../../assets/patnix.png;
        padding = {
          top = 2;
          left = 1;
        };
      };

      display = {
        separator = "  ";
        disableLinewrap = true;
        color = {
          keys = accent;
          title = accent;
          separator = dim;
          output = text;
        };
      };

      modules = [
        "break"
        "break"
        "title"
        "break"

        (mod "os" "f313" { format = "{#keys}{pretty-name}{#} {arch}"; })
        (mod "kernel" "f17c" { format = "{#keys}{sysname}{#} {release}"; })
        (mod "packages" "f487" {
          format = "{#keys}{all}{#} total ({nix-system} system, {nix-user} user, {flatpak-user} flatpak)";
        })
        (mod "localip" "f0200" { format = "{#keys}{ipv4}{#} on {ifname}"; })
        (mod "uptime" "f0150" { })
        "break"

        (mod "wm" "f2d0" { format = "{#keys}{pretty-name}{#} {version} ({protocol-name})"; })
        (mod "shell" "f120" { format = "{#keys}{pretty-name}{#} {version}"; })
        (mod "terminal" "ea85" { format = "{#keys}{pretty-name}{#} {version}"; })
        (mod "terminalfont" "f031" { format = "{#keys}{name}{#} ({size}pt)"; })
        "break"

        (mod "host" "eabe" { format = "{#keys}{name}{#}{?version} ({version}){?}"; })
        (mod "cpu" "f2db" { format = "{#keys}{name}{#} ({cores-logical}) @ {freq-max}"; })
        (mod "gpu" "f08ae" { format = "{#keys}{vendor} {name}{#}"; })
        (mod "memory" "efc5" { format = "{#keys}{used}{#} / {total} ({percentage})"; })
        (mod "display" "f0379" { format = "{#keys}{name}{#}  {width}x{height} @ {refresh-rate}Hz"; })
        "break"

        (mod "disk" "f02ca" {
          format = "{#keys}{mountpoint}{#}  {size-used} / {size-total} ({size-percentage})";
        })
        "break"

        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
}

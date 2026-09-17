{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    targets = {
      btop.enable = true;
      ghostty.enable = true;
      gtk = {
        enable = true;
        flatpakSupport.enable = true;
      };
      hyprland.enable = true;
      kde.enable = true;
      lazygit.enable = true;
      mangohud.enable = true;
      mpv.enable = true;
      noctalia.enable = true;
      obsidian.enable = true;
      qt.enable = true;
      yazi.enable = true;
    };
  };
}

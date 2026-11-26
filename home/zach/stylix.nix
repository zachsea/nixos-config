{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/stella.yaml";
    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sansSerif = {
        package = pkgs.rubik;
        name = "Rubik";
      };
      monospace = {
        package = pkgs.maple-mono.NF;
        name = "Maple Mono NF";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 10.5;
        terminal = 11.5;
        desktop = 10.5;
        popups = 10.5;
      };
    };
    opacity = {
      terminal = 0.95;
    };
    cursor = {
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 24;
    };
    targets = {
      btop.enable = true;
      fontconfig.enable = true;
      font-packages.enable = true;
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

  # provide icons for KDE apps
  qt.qt6ctSettings.Appearance.icon_theme = "breeze-dark";
}

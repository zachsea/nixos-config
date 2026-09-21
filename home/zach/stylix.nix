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
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 10;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };
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

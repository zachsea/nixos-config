{ pkgs, lib, inputs, ... }:
{
  programs.hyprland.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "pixie";
    package = lib.mkForce pkgs.kdePackages.sddm; 
    extraPackages = [
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qtdeclarative
      pkgs.kdePackages.qt5compat
    ];
    settings.Theme.CursorTheme = "breeze_cursors";
  };
  services.displayManager.defaultSession = "hyprland";

  environment.systemPackages = [
    (inputs.pixie-sddm.packages.${pkgs.stdenv.hostPlatform.system}.pixie-sddm.override {
      background = ../../assets/sddm.png;
      avatar = ../../assets/avatar.png;
      autoColor = true;
      # accentColor = "#3F5F91";
      # backgroundColor = "#1A1C1E";
      # textColor = "#E2E2E6";         
      # fontFamily = "JetBrains Mono";
    })
  ];
}

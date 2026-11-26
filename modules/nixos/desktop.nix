{
  pkgs,
  inputs,
  ...
}:
{
  programs.hyprland.enable = true;

  qt.enable = true; # makes Qt plugins/QML from installed profiles discoverable (kvantum, qt6ct, KIO)
  programs.dconf.enable = true; # stylix's gtk target writes its settings to dconf
  services.udisks2.enable = true; # mount/eject drives from Dolphin's Places panel
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # file chooser etc., Hyprland's portal config falls back to gtk

  environment.pathsToLink = [
    "/share/color-schemes" # stylix's KDE colour scheme
    "/share/kio/servicemenus" # Dolphin context-menu entries (e.g. Ark's extract/compress)
  ];

  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "pixie";
        extraPackages = [
          pkgs.kdePackages.qtsvg
          pkgs.kdePackages.qtdeclarative
          pkgs.kdePackages.qt5compat
        ];
        settings.Theme.CursorTheme = "macOS";
      };
      defaultSession = "hyprland";
    };
  };
  environment.systemPackages = [
    pkgs.apple-cursor
    (inputs.pixie-sddm.packages.${pkgs.stdenv.hostPlatform.system}.pixie-sddm.override {
      background = ../../assets/sddm.png;
      avatar = ../../assets/avatar.png;
      autoColor = true;
    })
  ];
}

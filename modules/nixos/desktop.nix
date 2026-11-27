{
  pkgs,
  inputs,
  ...
}:
{
  qt.enable = true; # stylix's gtk target writes its settings to dconf
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # file chooser etc., Hyprland's portal config falls back to gtk

  programs = {
    hyprland.enable = true; # makes Qt plugins/QML from installed profiles discoverable (kvantum, qt6ct, KIO)
    dconf.enable = true; # mount/eject drives from Dolphin's Places panel
    fuse.enable = true; # fusermount3 for kio-fuse
  };

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
    udisks2.enable = true;
  };

  environment = {
    pathsToLink = [
      "/share/color-schemes" # stylix's KDE colour scheme
      "/share/kio/servicemenus" # Dolphin context-menu entries (e.g. Ark's extract/compress)
    ];
    systemPackages = [
      pkgs.apple-cursor
      pkgs.kdePackages.kio-fuse
      (inputs.pixie-sddm.packages.${pkgs.stdenv.hostPlatform.system}.pixie-sddm.override {
        background = ../../assets/sddm.png;
        avatar = ../../assets/avatar.png;
        autoColor = true;
      })
    ];
  };
}

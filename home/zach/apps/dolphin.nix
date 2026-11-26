{ pkgs, ... }:

{
  home.packages = with pkgs.kdePackages; [
    dolphin
    kio
    kio-extras

    # icons
    qtsvg
    breeze-icons

    # thumbnails
    kdegraphics-thumbnailers
    ffmpegthumbs

    # additional image formats
    kimageformats
    qtimageformats
  ];
  xdg = {

    mimeApps = {
      enable = true;
      defaultApplications."inode/directory" = "org.kde.dolphin.desktop";
    };

    # dolphin's Open With application chooser
    configFile."menus/applications.menu".text = ''
      <!DOCTYPE Menu PUBLIC "-//freedesktop//DTD Menu 1.0//EN"
        "http://www.freedesktop.org/standards/menu-spec/1.0/menu.dtd">
      <Menu>
        <Name>Applications</Name>
        <DefaultAppDirs/>
        <DefaultDirectoryDirs/>
        <Include>
          <All/>
        </Include>
      </Menu>
    '';

    # add plasma-manager again if we need more stuff
    systemDirs.config = [
      "${pkgs.writeTextDir "kdeglobals" ''
        [General]
        TerminalApplication=ghostty
        TerminalService=com.mitchellh.ghostty.desktop
      ''}"
    ];
  };
}

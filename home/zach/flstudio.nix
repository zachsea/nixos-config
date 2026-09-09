{
  imports = [
    #../pkgs/pipeasio.nix
  ];


  home.file = {
    # launcher
    ".local/bin/flstudio" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        export WINEPREFIX="$HOME/.wine-flstudio"
        export WINEDLLPATH="$HOME/.local/lib/wine"

        exec wine "$WINEPREFIX/drive_c/Program Files/Image-Line/FL Studio 2025/FL64.exe" "$@"
      '';
    };
    # icon
    ".local/share/icons/hicolor/256x256/apps/flstudio.png".source = ../../assets/icons/flstudio256.png;
    # desktop entry
    ".local/share/applications/flstudio.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=FL Studio 2025
      Icon=flstudio
      Exec=/home/zach/.local/bin/flstudio
      Terminal=false
      Categories=AudioVideo;Audio;
      StartupNotify=true
    '';
  };
}

# one time installer example if using pipeasio
# #!/usr/bin/env bash
#
# set -e
# export WINEPREFIX="$HOME/.wine-flstudio"
# export PIPEASIO_PREFIX="$HOME/.local"
# wineboot -u
# exec wine "$HOME/Downloads/FL_Studio_2025_installer.exe"
# ~/.local/bin/pipeasio-register
# winetricks corefonts vcrun2015 gdiplus dxvk

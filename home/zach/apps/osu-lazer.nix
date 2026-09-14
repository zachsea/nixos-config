{ pkgs, config, ... }:
{
  home.packages = [
    # wrap the osu-lazer-bin package to always include the low-latency env var
    (pkgs.symlinkJoin {
      name = "osu-lazer-wrapped";
      paths = [ pkgs.osu-lazer-bin ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram "$out/bin/osu!" \
          --set PIPEWIRE_LATENCY "64/48000"
      '';
    })
  ];
  # symlink to windows install, should be fine to share
  home.file.".local/share/osu".source = config.lib.file.mkOutOfStoreSymlink "/mnt/winc/Users/3zach/AppData/Roaming/osu/";
}


{ pkgs, ... }:
let
  discord-egl = pkgs.symlinkJoin {
    name = "discord-egl";
    paths = [ pkgs.discord ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/discord --add-flags "--use-gl=egl"
    '';
  };
in
{
  programs.discord = {
    enable = true;
    package = discord-egl;
  };

  xdg.desktopEntries.discord = {
    name = "Discord";
    genericName = "Internet Messenger";
    exec = "${discord-egl}/bin/discord %U";
    icon = "discord";
    type = "Application";
    categories = [
      "Network"
      "InstantMessaging"
    ];
    mimeType = [ "x-scheme-handler/discord" ];
  };
}

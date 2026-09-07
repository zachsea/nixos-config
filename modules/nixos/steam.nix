{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    # community proton w/ patches
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  # bin for requesting gamemode
  programs.gamemode.enable = true;
}

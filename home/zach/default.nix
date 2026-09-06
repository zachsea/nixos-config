{ pkgs, stateVersion, ... }:
{
  imports = [
    ./git.nix
    ./ssh.nix
    ./flatpak.nix
    ./lazyvim.nix
  ];

  home.stateVersion = stateVersion;
  home.packages = with pkgs; [
    discord
    flameshot
    ghostty
    google-chrome
  ];
}

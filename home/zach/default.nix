{ stateVersion, ... }:
{
  imports = [
    ./git.nix
    ./ssh.nix
    ./flatpak.nix
    ./lazyvim.nix
    ./ghostty.nix
    ./discord.nix
    ./flameshot.nix
    ./google_chrome.nix
    ./vicinae.nix
    ./btop.nix
    ./hotkeys.nix
    ./sops.nix
    ./mangohud.nix
  ];

  home.stateVersion = stateVersion;
}

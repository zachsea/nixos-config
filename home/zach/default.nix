{ stateVersion, ... }:
{
  imports = [
    ./git.nix
    ./ssh.nix
    ./flatpak.nix
    ./lazyvim.nix
    ./ghostty.nix
    ./discord.nix
    ./google-chrome.nix
    ./vicinae.nix
    ./btop.nix
    ./hotkeys.nix
    ./sops.nix
    ./mangohud.nix
    ./prismlauncher.nix
    ./yazi.nix
    ./osu-lazer.nix
    ./unrar.nix
    ./fooyin.nix
    ./mpv.nix
    ./vlc.nix
    ./kolourpaint.nix
  ];

  home.stateVersion = stateVersion;
}

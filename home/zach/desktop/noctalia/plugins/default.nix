{
  imports = [
    ./color-picker.nix
    ./file-search.nix
    ./hassio.nix
    ./nix-monitor.nix
    ./nvtop.nix
    ./prismlauncher-instances.nix
    ./ssh-launcher.nix
    ./tailnet.nix
  ];

  programs.noctalia.settings.plugins.auto_update = "none";
}

{
  imports = [
    ./bar
    ./plugins
    ./shell
    ./control-center.nix
    ./desktop-widgets.nix
    ./location.nix
    ./wallpaper.nix
    ./weather.nix
  ];

  programs.noctalia.enable = true;
}

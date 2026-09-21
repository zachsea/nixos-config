{
  imports = [
    ./animation.nix
    ./screenshot.nix
  ];

  programs.noctalia.settings.shell = {
    polkit_agent = true;
  };
}

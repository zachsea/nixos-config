{ stateVersion, ... }:
{
  imports = [
    ./apps
    ./cli
    ./desktop
    ./stylix.nix
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  home.stateVersion = stateVersion;
}

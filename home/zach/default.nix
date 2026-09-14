{ stateVersion, ... }:
{
  imports = [
    ./apps
    ./cli
    ./desktop
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  home.stateVersion = stateVersion;
}

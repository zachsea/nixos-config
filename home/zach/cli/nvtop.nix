{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nvtopPackages.nvidia
  ];
}

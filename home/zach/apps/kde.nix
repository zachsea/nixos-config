{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.kolourpaint
    kdePackages.dolphin
  ];
}

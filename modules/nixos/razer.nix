{ pkgs, ... }:
{
  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
    openrazer-daemon
  ];
  # must be in openrazer group to access
}

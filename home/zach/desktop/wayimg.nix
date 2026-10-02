{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.wayimg.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}

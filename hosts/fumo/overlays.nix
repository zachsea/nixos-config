{ inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.wayimg.overlays.default
  ];
}

{ inputs, stateVersion, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    ./mounts.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/nix-settings.nix
    ../../modules/nixos/rgb.nix
    ../../modules/nixos/cachix.nix
    ../../modules/nixos/sops.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/tablet.nix
  ];

  networking.hostName = "fumo";
  time.timeZone = "America/Los_Angeles";

  services.flatpak.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit stateVersion; };
    sharedModules = [
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
      inputs.plasma-manager.homeModules.plasma-manager
    ];
    users.zach = import ../../home/zach;
  };

  system.stateVersion = stateVersion;
}

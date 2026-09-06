{
  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/0263-FD43";
    fsType = "vfat";
    options = [ "umask=0077" ];
  };

  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    gfxmodeEfi = "1920x1080";
  };
}

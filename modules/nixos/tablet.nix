{ pkgs, ... }: {

  # disable the default kernel driver so it leaves the tablet alone
  boot.blacklistedKernelModules = [ "hid-uclogic" ];

  # allow user drivers to inject cursor positioning data
  boot.kernelModules = [ "uinput" ];

  # giving user access to the raw hardware
  services.udev.extraRules = ''
    KERNEL=="hidraw*", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0094", MODE="0666"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0094", MODE="0666", TAG+="uaccess"
    KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"
  '';
}

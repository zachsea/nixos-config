{
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/mnt/winc" = {
    device = "/dev/disk/by-uuid/C69410B49410A947";
    fsType = "ntfs3";
    options = [ "nofail" "uid=1000" "gid=100" "dmask=022" "fmask=133" ];
  };

  fileSystems."/mnt/winx" = {
    device = "/dev/disk/by-uuid/AE046AA4046A6F71";
    fsType = "ntfs3";
    options = [ "nofail" "uid=1000" "gid=100" "dmask=022" "fmask=133" ];
  };

  fileSystems."/mnt/winz" = {
    device = "/dev/disk/by-uuid/08BE60E1BE60C930";
    fsType = "ntfs3";
    options = [ "nofail" "uid=1000" "gid=100" "dmask=022" "fmask=133" ];
  };

  fileSystems."/mnt/wing" = {
    device = "/dev/disk/by-uuid/40D6A92FD6A925DE";
    fsType = "ntfs3";
    options = [ "nofail" "uid=1000" "gid=100" "dmask=022" "fmask=133" ];
  };
}

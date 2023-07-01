{ pkgs, ... }:

{
  fileSystems."/run/media/Media" = { 
    device = "/dev/disk/by-label/Media";
    fsType = "ntfs";
    noCheck = true;  # Skip fsck
    options = [ "nofail" ];  # nofail will not crash the system if failed to mount
  };
}
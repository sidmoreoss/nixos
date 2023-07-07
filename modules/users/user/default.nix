{ user, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.siddharth = {
    isNormalUser = true;
    # description = ${user};
    extraGroups = [ "networkmanager" "wheel" "storage" "video" "audio" "camera" "lp" "scanner" "kvm" "libvirtd" ];
  };
}
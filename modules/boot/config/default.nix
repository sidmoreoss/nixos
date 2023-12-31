{ pkgs, ... }:

{
  # Configure booting.
  boot = {
    # Enable ntfs
    supportedFilesystems = [ "ntfs" ];

    # Specify the kernel https://nixos.wiki/wiki/Linux_kernel
    # Kernel is device specific, recommended to define the kernel in host configuration

    loader = {
      # Use the systemd-boot EFI boot loader.
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };

    # Silent Boot
    kernelParams = [ 
      "quiet" 
      "rd.systemd.show_status=false" 
      "rd.udev.log_level=3" 
      "udev.log_priority=3" 
      "boot.shell_on_fail" 
      # "fbcon=nodefer"  # Disable the vendor logo once os boots
    ];

    # Plymouth hides all logs from boot screen
    plymouth = {
      enable = true;
      extraConfig = "ShowDelay=5";
    };
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
}
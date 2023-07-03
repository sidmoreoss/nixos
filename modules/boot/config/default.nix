{ pkgs, ... }:

{
  # Configure booting.
  boot = {
    # Enable ntfs
    supportedFilesystems = [ "ntfs" ];

    # Specify the kernel https://nixos.wiki/wiki/Linux_kernel
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages_zen;

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
    ];

    # Plymouth hides all logs from boot screen
    plymouth.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
}
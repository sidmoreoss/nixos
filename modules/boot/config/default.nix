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
    # https://wiki.archlinux.org/title/Silent_boot
    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    consoleLogLevel = 3;
    
    # https://github.com/NixOS/nixpkgs/pull/108294
    initrd.verbose = false;
  };
}
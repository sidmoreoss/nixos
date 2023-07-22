{ lib, pkgs, ... }:

{
  # Specific configuration for dell7560 should go below
  imports = [ 
    ./hardware-configuration.nix # Current system hardware config 
  ];

  # boot.kernelPackages = pkgs.linuxPackages-rt_latest;
  # boot.kernelPackages = pkgs.linuxPackages_latest_xen_dom0;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  
  powerManagement.cpuFreqGovernor = "performance";
}

{ lib, pkgs, ... }:

{
  # Specific configuration for dell7560 should go below
  imports = [ 
    ./hardware-configuration.nix # Current system hardware config 
  ];

  boot.kernelPackages = pkgs.linuxPackages-rt_latest;

  powerManagement.cpuFreqGovernor = "performance";
}

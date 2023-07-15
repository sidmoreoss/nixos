{ lib, ... }:

{
  # Specific configuration for dell7560 should go below
  imports = [ 
    ./hardware-configuration.nix # Current system hardware config 
  ];

  powerManagement.cpuFreqGovernor = lib.mkForce "performance";
}

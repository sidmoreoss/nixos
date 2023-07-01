# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:

{
  # Change the configuration path of nix
  # nix.nixPath = [ "nixos-config=/path/to/configuration.nix" ];
  
  imports = 
  [
    ./hardware-configuration.nix # Current system hardware config @ /etc/nixos/hardware-configuration.nix
    ./home-manager.nix
    ./modules
  ];
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
  # Don't change the state version
}

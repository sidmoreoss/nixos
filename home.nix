{ config, pkgs, ... }:
{
  imports = [
    ./modules/home.nix
  ];

  /* The home.stateVersion option does not have a default and must be set */
  home.stateVersion = "18.09";  # Don't change this
}


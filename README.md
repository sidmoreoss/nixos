# My Nixos configuration

## Installation

1. > :warning: Copy hardware configuration from ```/etc/nixos/hardware-configuration.nix``` to ```<path to config>/hosts/<host name>``` else it may break your entire system, this needs to be done for a new system configuration.

2. >Execute ```sudo nixos-rebuild switch --flake <path>#<hostname>``` to apply the configuration.

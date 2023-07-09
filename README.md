# My Nixos configuration

## Installation

### Copy and paste commands in order

1. ```git clone git@github.com:sidmoreoss/nixos.git ~/.setup```
2. ```cd ~/.setup/nixos```
3. ```cp /etc/nixos/hardware-configuration.nix ./hosts/dell7560```
4. ```sudo nixos-rebuild switch --flake .#dell7560``` to apply the configuration.
5. In above commands 'dell7560' can be changed to any supported hosts, supported hosts are ```dell7560```

## Usage

1. To update the system: ```nix flake update```
2. To update or rebuild the system: ```sudo nixos-rebuild switch --flake .#dell7560```
3. Note: Step 2 should be executed if there is a change in configuration files. To update the system Step 2 should be executed after Step 1.

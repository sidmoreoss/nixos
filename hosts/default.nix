{ lib, inputs, nixpkgs, nixpkgs-unstable, home-manager, nur, user, location, plasma-manager, ... }:

let
  system = "x86_64-linux";                                  # System architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;                              # Allow proprietary software
  };

  unstable = import nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;                              # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{
  dellInspiron7560 = lib.nixosSystem {                                # Laptop profile
    inherit system;

    specialArgs = {
      inherit unstable inputs user location;
    };

    modules = [
      nur.nixosModules.nur
      ./configuration.nix  # Configuration for all hosts
      ./dellInspiron7560  # Configuration for dell inspiron 7560

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit unstable user; };
        home-manager.users.${user} = {
          imports = [
            plasma-manager.homeManagerModules.plasma-manager  # Enable plasma-manager
            ./home.nix  # Personal home configuration
            ./dellInspiron7560/home.nix  # Home configuration for laptop
          ];
        };
      }
    ];
  };
}

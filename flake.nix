{
  description = "My personal NixOS configuration";

  inputs =  # All flake references used to build my NixOS setup. These are dependencies.
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";  # Default Stable Nix Packages

      nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";  # Unstable Nix Packages

      home-manager = {  # User Package Management
        url = "github:nix-community/home-manager/release-23.05";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      nur = {  # NUR Packages to use add "nur.nixosModules.nur" to the host modules
        url = "github:nix-community/NUR";
      };

      plasma-manager = {  # KDE Plasma user settings to use add "inputs.plasma-manager.homeManagerModules.plasma-manager" to the home-manager.users.${user}.imports
        url = "github:pjones/plasma-manager";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.home-manager.follows = "nixpkgs";
      };
    };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, nur, plasma-manager, ... }:  # Function that tells my flake which to use and what do what to do with the dependencies.
    let  # Variables that can be used in the config files.
      user = "siddharth";
      location = "$HOME/.setup";

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
    in  # Use above variables in ...
    {
      nixosConfigurations = {
        dellInspiron7560 = lib.nixosSystem {                                # Laptop profile
          inherit system;

          specialArgs = {
            inherit unstable inputs user location;
          };

          modules = [
            nur.nixosModules.nur
            # ./dellInspiron7560
            ./configuration.nix

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit unstable user; };
              home-manager.users.${user} = {
                imports = [
                  plasma-manager.homeManagerModules.plasma-manager  # Enable plasma-manager
                  ./home.nix  # Personal home configuration
                  # ./dellInspiron7560/home.nix  # Home configuration for laptop
                ];
              };
            }
          ];
        };
      };
    };
}

{
  description = "My personal NixOS configuration";

  inputs =  # All flake references used to build my NixOS setup. These are dependencies.
    {
      nixpkgs.url = "github:nixos/nixpkgs";  # Default Stable Nix Packages

      nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";  # Unstable Nix Packages

      home-manager = {  # User Package Management
        url = "github:nix-community/home-manager";
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
    in  # Use above variables in ...
    {
      nixosConfigurations = (  # NixOS configurations
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs nixpkgs-unstable home-manager nur user location plasma-manager;  # Also inherit home-manager so it does not need to be defined here.
        }
      );
    };
}

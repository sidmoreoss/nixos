{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";

  # Using plasma-manager without flakes: https://github.com/pjones/plasma-manager/issues/19
  plasma-manager = pkgs.fetchFromGitHub {
    owner = "pjones";
    repo = "plasma-manager";
    rev = "16c437e43a0e049b15c9bfd37295f6e978ea995";
    sha256 = "sha256-dOnnzfqd/PCf1K3USKq2PqSGKmIqkr/SD7zHb1yoAyw=";
  };
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.useGlobalPkgs = true;

  home-manager.users.siddharth = {
    imports = [
      (plasma-manager + "/modules")
      ./modules/home.nix
    ];

    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "18.09";  # Don't change this
  };
}


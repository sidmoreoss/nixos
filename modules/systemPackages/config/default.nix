{ config, pkgs, ... }:

{
  environment.localBinInPath = true;  # Add ~/.local/bin/ to $PATH

  nixpkgs.config.allowUnfree = true;  # Allow unfree packages

  # Nix store garbage collection
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];  # Allow use of flakes
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}

{ config, pkgs, ... }:

{
  environment.localBinInPath = true;  # Add ~/.local/bin/ to $PATH

  nixpkgs.config.allowUnfree = true;  # Allow unfree packages

  nix = {
    settings = {
      auto-optimise-store = true;  # Save space via hardlinking store files
      experimental-features = [ "nix-command" "flakes" ];  # Allow use of flakes
    };

    gc = {  # Nix store garbage collection
      automatic = true;  
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}

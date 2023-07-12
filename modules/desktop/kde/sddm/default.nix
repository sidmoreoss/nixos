{ config, pkgs, lib, ... }:
let 
  sddm-background = pkgs.stdenv.mkDerivation {
    pname = "sddm-background";
    version="v0.1";
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out/share/sddm/themes/breeze/
      echo -e "[General]\ntype=image\nbackground=${lib.getBin pkgs.libsForQt5.plasma-workspace-wallpapers}/share/wallpapers/OneStandsOut/contents/images/1920x1080.jpg" > $out/share/sddm/themes/breeze/theme.conf.user
    '';
  };
in { 
  environment.systemPackages = [ sddm-background ];
}


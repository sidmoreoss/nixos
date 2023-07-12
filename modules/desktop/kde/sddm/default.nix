{ config, pkgs, lib, ... }:
let 
  sddm-background = pkgs.stdenv.mkDerivation {
    pname = "sddm-background";
    version="v0.1";
    src = ./.;
    phases = [ "unpackPhase" "installPhase" ];
    installPhase = ''
      mkdir -p $out/share/sddm/themes/breeze/
      cp $src/background.jpg $out/share/sddm/themes/breeze/
      echo -e "[General]\ntype=image\nbackground=background.jpg" > $out/share/sddm/themes/breeze/theme.conf.user
    '';
  };
in { 
  environment.systemPackages = [ sddm-background ];
}


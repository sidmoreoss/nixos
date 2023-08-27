{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    merriweather-sans
    meslo-lgs-nf
  ];
}


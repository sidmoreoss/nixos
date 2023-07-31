{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    merriweather-sans
  ];
}
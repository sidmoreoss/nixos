{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    merriweather-sans
    font-awesome
  ];
}
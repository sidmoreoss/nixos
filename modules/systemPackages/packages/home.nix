{ ... }:
{
  home.file = {  # My scripts
    ".local/bin" = {
      source = ../../../sources/scripts;
      recursive = true;
    };
  };
}
{ ... }:
{
  home.file = {  # My scripts
    ".local/bin" = {
      source = ../../../resources/scripts;
      recursive = true;
    };
  };
}
{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.siddharth = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "18.09";
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */

    # Configure shell
    programs.zsh = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      autocd = true;
      history = {
        size = 10000;
      };
    };

    # Configure git
    programs.git = {
      enable = true;
      userName  = "Siddharth More";
      userEmail = "sidmoreoss@gmail.com";
    };
  };
}


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

    # Configure shell: https://nixos.wiki/wiki/Zsh
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
        size = 100000;
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
    };

    # Configure git
    programs.git = {
      enable = true;
      userName  = "Siddharth More";
      userEmail = "sidmoreoss@gmail.com";
    };

    # Configure scripts https://borretti.me/article/nixos-for-the-impatient
    home.file = {
      ".local/bin" = {
        source = ./sources/scripts;
        recursive = true;
      };
    };
    

    # Pipewire config for no resampling (find a better way to do this)
    xdg.configFile."pipewire/pipewire.conf.d/pipewire.conf".text = 
      ''  
      {
        context.properties = {
          # default.clock.rate = 48000;
          default.clock.allowed-rates = [ 44100 48000 88200 96000 192000 384000 ];
        };
      }
      '';

    xdg.configFile."pipewire/pipewire-pulse.conf.d/pipewire-pulse.conf".text = 
      ''
      {  
        stream.properties = {
            resample.quality = 15
        }
      }
      '';

    xdg.configFile."pipewire/client.conf.d/client.conf".text = 
      ''
      {  
        stream.properties = {
            resample.quality = 15
        }
      }
      '';
  };
}


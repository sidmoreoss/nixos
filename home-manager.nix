{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";

  # Using plasma-manager without flakes: https://github.com/pjones/plasma-manager/issues/19
  plasma-manager = pkgs.fetchFromGitHub {
    owner = "pjones";
    repo = "plasma-manager";
    rev = "16c437e43a0e049b15c9bfd37295f6e978ea995";
    sha256 = "sha256-dOnnzfqd/PCf1K3USKq2PqSGKmIqkr/SD7zHb1yoAyw=";
  };
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.useGlobalPkgs = true;

  home-manager.users.siddharth = {
    imports = [
      (plasma-manager + "/modules")
    ];


    # Plasma settings: plasma-manager
    programs.plasma = {
      enable = true;
      workspace.clickItemTo = "select";
      shortcuts = {
        "kwin"."Switch to Desktop 1" = "Meta+1";
        "kwin"."Switch to Desktop 2" = "Meta+2";
        "kwin"."Switch to Desktop 3" = "Meta+3";
        "kwin"."Switch to Desktop 4" = "Meta+4";
        "kwin"."Switch to Desktop 5" = "Meta+5";
        "kwin"."Switch to Desktop 6" = "Meta+6";
        "kwin"."Switch to Desktop 7" = "Meta+7";
        "kwin"."Window to Desktop 1" = "Meta+!";
        "kwin"."Window to Desktop 2" = "Meta+@";
        "kwin"."Window to Desktop 3" = "Meta+#";
        "kwin"."Window to Desktop 4" = "Meta+$";
        "kwin"."Window to Desktop 5" = "Meta+%";
        "kwin"."Window to Desktop 6" = "Meta+^";
        "kwin"."Window to Desktop 7" = "Meta+&";
      };
      files = {
        "kwinrc"."Desktops"."Id_1" = "bd2a25bc-ab01-43a5-b63b-c23ae7d6662f";
        "kwinrc"."Desktops"."Id_2" = "fe50e4b2-b800-40fc-8e14-a7b31cb0bf29";
        "kwinrc"."Desktops"."Id_3" = "7eba4b70-370b-4972-bbb2-06a6d4546031";
        "kwinrc"."Desktops"."Id_4" = "7d0acff4-f961-4f95-8d8c-e69c905641a0";
        "kwinrc"."Desktops"."Id_5" = "194185a1-97c2-40cd-933c-46b2bd129d21";
        "kwinrc"."Desktops"."Id_6" = "87de3084-8184-49fd-b2f9-9fd17423b006";
        "kwinrc"."Desktops"."Id_7" = "298ffe3d-3f43-493b-8658-676d72af3219";
        "kwinrc"."Desktops"."Name_1" = "";
        "kwinrc"."Desktops"."Name_2" = "";
        "kwinrc"."Desktops"."Name_3" = "";
        "kwinrc"."Desktops"."Name_4" = "";
        "kwinrc"."Desktops"."Name_5" = "";
        "kwinrc"."Desktops"."Name_6" = "🎵";
        "kwinrc"."Desktops"."Name_7" = "";
        "kwinrc"."Desktops"."Number" = 7;
        "kwinrc"."Desktops"."Rows" = 7;
        "kwinrulesrc"."1"."Description" = "Virtual desktop for video players";
        "kwinrulesrc"."1"."desktops" = "194185a1-97c2-40cd-933c-46b2bd129d21";
        "kwinrulesrc"."1"."desktopsrule" = 2;
        "kwinrulesrc"."1"."wmclass" = "((^|, )(.*smplayer.*|.*vlc.*|.*torrent.*))+$";
        "kwinrulesrc"."1"."wmclassmatch" = 3;
        "kwinrulesrc"."2"."Description" = "Virtual desktop for terminals";
        "kwinrulesrc"."2"."desktops" = "7eba4b70-370b-4972-bbb2-06a6d4546031";
        "kwinrulesrc"."2"."desktopsrule" = 2;
        "kwinrulesrc"."2"."wmclass" = "((^|, )(.*alacritty.*|.*konsole.*|.*xterm.*|.*terminator.*))+$";
        "kwinrulesrc"."2"."wmclassmatch" = 3;
        "kwinrulesrc"."3"."Description" = "Virtual desktop for settings";
        "kwinrulesrc"."3"."desktops" = "298ffe3d-3f43-493b-8658-676d72af3219";
        "kwinrulesrc"."3"."desktopsrule" = 2;
        "kwinrulesrc"."3"."wmclass" = "((^|, )(.*systemsettings.*|.*systemmonitor.*))+$";
        "kwinrulesrc"."3"."wmclasscomplete" = true;
        "kwinrulesrc"."3"."wmclassmatch" = 3;
        "kwinrulesrc"."4"."Description" = "Virtual desktop for music players";
        "kwinrulesrc"."4"."desktops" = "87de3084-8184-49fd-b2f9-9fd17423b006";
        "kwinrulesrc"."4"."desktopsrule" = 2;
        "kwinrulesrc"."4"."wmclass" = "((^|, )(.*lollypop.*|.*audacious.*|.*strawberry.*|.*spotify.*|.*elisa.*|.*audiotube.*|.*easyeffects.*|.*clementine.*))+$";
        "kwinrulesrc"."4"."wmclassmatch" = 3;
        "kwinrulesrc"."5"."Description" = "Virtual desktop for files";
        "kwinrulesrc"."5"."desktops" = "7d0acff4-f961-4f95-8d8c-e69c905641a0";
        "kwinrulesrc"."5"."desktopsrule" = 2;
        "kwinrulesrc"."5"."wmclass" = "((^|, )(.*dolphin.*|.*okular.*|.*gwenview.*))+$";
        "kwinrulesrc"."5"."wmclassmatch" = 3;
        "kwinrulesrc"."6"."Description" = "Virtual desktop for text editors";
        "kwinrulesrc"."6"."desktops" = "fe50e4b2-b800-40fc-8e14-a7b31cb0bf29";
        "kwinrulesrc"."6"."desktopsrule" = 2;
        "kwinrulesrc"."6"."wmclass" = "((^|, )(.*code.*|.*kate.*|.*jetbrains.*))+$";
        "kwinrulesrc"."6"."wmclassmatch" = 3;
        "kwinrulesrc"."7"."Description" = "Virtual desktop for browsers";
        "kwinrulesrc"."7"."desktops" = "bd2a25bc-ab01-43a5-b63b-c23ae7d6662f";
        "kwinrulesrc"."7"."desktopsrule" = 2;
        "kwinrulesrc"."7"."wmclass" = "((^|, )(.*firefox.*|.*brave.*|.*chrom.*))+$";
        "kwinrulesrc"."7"."wmclasscomplete" = true;
        "kwinrulesrc"."7"."wmclassmatch" = 3;
        "kwinrulesrc"."General"."count" = 7;
        "kwinrulesrc"."General"."rules" = "1,2,3,4,5,6,7";
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

    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "18.09";  # Don't change this
  };
}


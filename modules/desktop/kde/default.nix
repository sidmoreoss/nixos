{ pkgs, ... }:

{
  programs = {
    dconf.enable = true;  # Enable GTK settings sync with KDE settings
    kdeconnect.enable = true;  # Enable KDE connect service
    partition-manager.enable = true;  # KDE partition manager 
  };

  services.xserver = {
    enable = true;  # Enable the X11 windowing system.

    layout = "us";  # Keyboard layout
    xkbVariant = "";

    displayManager = {
      sddm = {
        enable = true;
        settings = {
          Theme={
            Font = "Merriweather Sans Black, 10";
            CursorTheme = "breeze_cursors";
          };
        };
      };
      defaultSession = "plasmawayland";
    };

    desktopManager.plasma5.enable = true;
  };

  environment = {
    systemPackages = with pkgs.libsForQt5; [  # Packages installed
      # packagekit-qt  # Enable discover
      # discover
      filelight
    ];
    plasma5.excludePackages = with pkgs.libsForQt5; [
      elisa
      khelpcenter
      oxygen
      kolourpaint
      kcharselect
    ];
  };
}

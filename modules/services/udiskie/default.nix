#
# Mounting tool
#

{ ... }:

{
  services = {
    udiskie = {  # Udiskie wil automatically mount storage devices
      enable = true;
      automount = true;
      tray = "auto";  # Will only show up in systray when active
    };
  };
}

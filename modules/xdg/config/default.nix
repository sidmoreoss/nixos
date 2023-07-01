{ pkgs, ... }:

{
  # Enable xdg desktop integration
  xdg = {
    autostart.enable = true;  # Enable autostart applications
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk  # Enable gtk portal
      ];
    };
  };
}

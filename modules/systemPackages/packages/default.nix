{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    kate
    firefox-wayland
    brave
    # firefox-beta-bin
    strawberry
    qbittorrent
    libsForQt5.filelight
    libsForQt5.packagekit-qt
    libsForQt5.sddm-kcm
    variety
    vscode
    vlc
    fzf
    libreoffice-qt
  ];
}

{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    # Browsers
    firefox-beta  # Beta version (v115 >) supports hardware video decoding

    # Text/Code editors
    kate
    # vscode - Replaced by neovim
    
    # Video players
    vlc

    # Torrent
    qbittorrent

    # Music
    spotify
    strawberry  # Music player
    kid3  # Audio tagger

    # Utils
    wget  # Downloader
    krename  # Bulk rename
    fzf  # Fuzzy search
    ripgrep  # Dependency of my neovim config

    # Wallpaper
    variety

    # Office
    libreoffice-qt
  ];
}

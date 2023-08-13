{ pkgs, ... } : {
  xdg.dataFile."wallpapers/myWallpaperCollection" = {
    source = pkgs.fetchFromGitLab {
      owner = "sidmoreoss";
      repo = "wallpapers";
      rev = "1.0.0";
      sha256 = "sha256-8S3pggRvXnRuS/a7DK3XbeTFJoNw9Lu5ojqXMqn2/Ew=";
    } + "/Wallpapers";
    recursive = true;
  };
}

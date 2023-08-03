{ pkgs, ... } : {
  xdg.dataFile."wallpapers/myWallpaperCollection" = {
    source = pkgs.fetchFromGitLab {
      owner = "sidmoreoss";
      repo = "wallpapers";
      rev = "main";
      sha256 = "sha256-Hv8vrdNqojS5WI/hxYzfjurp2QumFXbiTa4/aCtT4d4=";
    } + "/Wallpapers";
    recursive = true;
  };
}

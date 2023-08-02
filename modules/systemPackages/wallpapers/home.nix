{ pkgs, ... } : {
  xdg.dataFile."wallpapers/wallpapers" = {
    source = pkgs.fetchzip {
      url = "https://drive.google.com/uc?id=171Ino_vZLQNA4LcVJv3Nh9Q-oLfBHvNC&confirm=t&export=download.zip";
      # use this url if above does not work https://drive.google.com/u/0/uc?id=171Ino_vZLQNA4LcVJv3Nh9Q-oLfBHvNC&export=download&confirm=t&uuid=40670228-b22a-4cde-9702-a545a3944282&at=ALt4Tm3Z9puRhzitOKS_jHRYTWI8:1691002055622
      sha256 = "sha256-Fv0IRm68wOEDtQGHNn7pYKQcUZoHJhS2q+5KK5D0b+Q=";
    };
    recursive = true;
  };
}

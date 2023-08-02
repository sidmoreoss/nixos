{ pkgs, ... } : {
  home.file = {  # My scripts
    ".local/bin" = {
      source = pkgs.fetchFromGitLab {
        owner = "lazylinux";
        repo = "programs";
        rev = "main";
        sha256 = "sha256-pn1dMjJM5cbTMtedl4NKTUuzT8WlGzl7Hn/wpj0FHt4=";
      } + "/programs";
      recursive = true;
    };
  };
}

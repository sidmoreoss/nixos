{ pkgs, ... } : 
let 
  # Refer https://nixos.wiki/wiki/Packaging/Binaries for packaging binaries
  myPrograms = pkgs.stdenv.mkDerivation {
    pname = "myPrograms";
    version = "1.0.0";
    src = pkgs.fetchFromGitLab {
      owner = "lazylinux";
      repo = "programs";
      rev = "1.0.0";
      sha256 = "sha256-zc7Y9ThgUk/1acFpeDrldUU5aRcbXKNidIFKik4qtk8=";
    } + "/programs";

    nativeBuildInputs = [
      pkgs.autoPatchelfHook
    ];

    sourceRoot = "./programs";

    installPhase = ''
      for program in *; do
        install -m755 -D $program $out/bin/$program
      done
    '';
  };
in {
  home.packages = [ myPrograms ];
}

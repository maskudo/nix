{pkgs}: let
  imageLink = "https://raw.githubusercontent.com/maskudo/dotfiles/main/wallpapers/Pictures/Wallpapers/7.png";
  image = pkgs.fetchurl {
    url = imageLink;
    hash = "sha256-1iP5eT2RgFcfs/C/sFXbJQmFGK2WVFe7pM6jHaS5GWo=";
  };
in
  pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-chili";
      rev = "6516d50176c3b34df29003726ef9708813d06271";
      sha256 = "sha256-wxWsdRGC59YzDcSopDRzxg8TfjjmA3LHrdWjepTuzgw=";
    };
    installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
      cd $out/assets
      rm background.jpg
      cp -r ${image} background.jpg
    '';
  }

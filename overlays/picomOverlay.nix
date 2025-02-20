{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      picom = prev.picom.overrideAttrs (old: {
        src = prev.fetchFromGitHub {
          owner = "yshui";
          repo = "picom";
          rev = "f4fcedc470d39ce21caae4d1d0f73dd7f0b2600e";
          sha256 = "sha256-FwjMlHP8xNJikkPpz+8BORrqqKYvRpkqm9GbExCoLAU=";
        };
        nativeBuildInputs = with pkgs; [
          asciidoctor
          docbook_xml_dtd_45
          docbook_xsl
          makeWrapper
          meson
          ninja
          pkg-config
          uthash
        ];
      });
    })
  ];
}

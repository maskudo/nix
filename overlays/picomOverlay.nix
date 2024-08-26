{pkgs, ...}: {
  nixpkgs.overlays = [
    (
      final: prev: {
        picom = prev.picom.overrideAttrs (old: {
          src = prev.fetchFromGitHub {
            owner = "yshui";
            repo = "picom";
            rev = "f4fcedc470d39ce21caae4d1d0f73dd7f0b2600e";
            sha256 = "sha256-59I6uozu4g9hll5U/r0nf4q92+zwRlbOD/z4R8TpSdo=";
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
      }
    )
  ];
}

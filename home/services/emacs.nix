{ pkgs, ... }:
{
  services.emacs.enable = true;
  services.emacs.package =
    with pkgs;
    ((emacsPackagesFor emacs-pgtk).emacsWithPackages (epkgs: [ epkgs.vterm ]));
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      pkgs.libtool
      pkgs.cmake
    ];
  };
}

{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      niri."org.freedesktop.impl.portal.FileChooser" = "gtk";
      niri.default = "gnome";
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
}

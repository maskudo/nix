{
  lib,
  pkgs,
  config,
  ...
}:
{
  services.displayManager =
    lib.mkIf
      (
        config.desktop.i3.enable
        || config.desktop.hyprland.enable
        || config.desktop.sway.enable
        || config.desktop.niri.enable
        || config.desktop.mango.enable
      )
      {
        sddm.enable = true;
        sddm.theme = "${import ../../modules/sddm-theme.nix { inherit pkgs; }}";
      };
  security.pam.services.sddm.enableGnomeKeyring = true;
}

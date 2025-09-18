{
  lib,
  pkgs,
  config,
  ...
}:
{
  services.displayManager =
    lib.mkIf (config.desktop.i3.enable || config.desktop.hyprland.enable || config.desktop.sway.enable)
      {
        sddm.enable = true;
        sddm.theme = "${import ../../modules/sddm-theme.nix { inherit pkgs; }}";
      };
}

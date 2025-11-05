{
  lib,
  pkgs,
  config,
  ...
}:
{
  services.displayManager =
    lib.mkIf (config.services.xserver.enable || config.services.displayManager.sddm.wayland.enable)
      {
        sddm.enable = true;
        sddm.theme = "${import ../../modules/sddm-theme.nix { inherit pkgs; }}";
      };
  security.pam.services.sddm.enableGnomeKeyring = true;
}

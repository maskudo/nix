{ pkgs, ... }:
{
  services.displayManager = {
    sddm.enable = true;
    sddm.theme = "${import ../../modules/sddm-theme.nix { inherit pkgs; }}";
  };
}

{ lib, ... }:
{
  imports = [
    ./i3.nix
    ./hypr.nix
    ./common.nix
    ./sddm.nix
  ];

  services.displayManager.defaultSession = lib.mkDefault "none+i3";
  desktop.i3.enable = lib.mkDefault true;
  desktop.hyprland.enable = lib.mkDefault false;
}

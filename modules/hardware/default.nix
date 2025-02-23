{ lib, ... }:
{
  imports = [
    ./core.nix
    ./boot.nix
    ./power.nix
    ./networking.nix
    ./tlp.nix
  ];
  powerModule.enable = lib.mkDefault false;
  tlpModule.enable = lib.mkDefault true;
}

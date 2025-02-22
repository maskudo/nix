{ lib, ... }:
{
  imports = [
    ./core.nix
    ./boot.nix
    ./power.nix
    ./networking.nix
  ];
  powerModule.enable = lib.mkDefault false;
}

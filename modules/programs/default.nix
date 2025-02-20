{ lib, ... }:
{
  imports = [
    ./nix-ld.nix
    ./graphical.nix
    ./core.nix
    ./virtualization.nix
    ./gaming.nix
  ];
  gaming.enable = lib.mkDefault true;
}

{lib, ...}: {
  imports = [./core.nix ./boot.nix ./power.nix];
  powerModule.enable = lib.mkDefault false;
}

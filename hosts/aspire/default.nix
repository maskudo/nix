{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./nvidia.nix
  ];
  desktop.i3.enable = false;
  desktop.hyprland.enable = false;
  powerModule.enable = true;
}

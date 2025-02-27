{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./nvidia.nix
  ];
  desktop.i3.enable = true;
  desktop.hyprland.enable = false;
  powerModule.enable = false;
}

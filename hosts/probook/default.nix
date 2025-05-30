{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
  ];
  desktop.i3.enable = true;
  desktop.hyprland.enable = false;
  desktop.sway.enable = false;
  powerModule.enable = false;
}

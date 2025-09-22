{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./nvidia.nix
  ];

  desktop.i3.enable = true;
  desktop.hyprland.enable = true;
  desktop.sway.enable = true;
  powerModule.enable = false;
  tlpModule.enable = false;
  ryzenadjModule.enable = true;

  services.nfs-client.enable = true;
  environment.variables = {
    MONITOR1 = "eDP";
    MONITOR2 = "HDMI-1-0";
    BATTERY = "BAT0";
    ADAPTER = "ACAD";
  };
}

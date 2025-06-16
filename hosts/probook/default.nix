{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
  ];
  desktop.i3.enable = false;
  desktop.hyprland.enable = false;
  desktop.sway.enable = false;
  powerModule.enable = false;
  services.proxmox.enable = true;
  environment.variables = {
    MONITOR1 = "eDP";
    MONITOR2 = "HDMI-1-0";
    BATTERY = "BAT0";
    ADAPTER = "ACAD";
  };

  networking.bridges = {
    "vmbr0" = {
      interfaces = [ "enp2s0" ];
    };
  };
  networking.interfaces.vmbr0 = {
    ipv4.addresses = [
      {
        address = "192.168.1.69";
        prefixLength = 24;
      }
    ];
  };

}

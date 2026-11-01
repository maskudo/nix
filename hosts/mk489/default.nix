{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./nvidia.nix
  ];
  desktop.i3.enable = false;
  desktop.hyprland.enable = false;
  desktop.mango.enable = true;
  gaming.enable = true;
  powerModule.enable = true;
  services.proxmox.enable = false;
  services.nfs-server.enable = true;
  homelab.services.k3s.enable = true;
  homelab.services.audiobookshelf.enable = true;

  networking.bridges = {
    "vmbr0" = {
      interfaces = [ "enp4s0f1" ];
    };
  };
  networking.interfaces.vmbr0 = {
    ipv4.addresses = [
      {
        address = "192.168.1.67";
        prefixLength = 24;
      }
    ];
  };
  networking.interfaces.enp4s0f1.wakeOnLan.enable = true;
  networking.firewall = {
    allowedUDPPorts = [ 9 ];
  };

  environment.variables = {
    MONITOR1 = "eDP1";
    MONITOR2 = "HDMI1";
    BATTERY = "BAT1";
    ADAPTER = "ADP1";
  };
}

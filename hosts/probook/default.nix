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

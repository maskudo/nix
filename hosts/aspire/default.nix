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

}

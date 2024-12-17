{
  lib,
  inputs,
  system,
  config,
  ...
}: let
  proxmox-nixos = inputs.proxmox-nixos;
in {
  imports = [
    proxmox-nixos.nixosModules.proxmox-ve
  ];
  options.services.proxmox = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Proxmox VE";
    };
  };
  config = lib.mkIf config.services.proxmox.enable {
    services.proxmox-ve.enable = true;
    nixpkgs.overlays = [
      proxmox-nixos.overlays.${system}
    ];

    networking.firewall.enable = false;
    networking.bridges = {
      "vmbr0" = {
        interfaces = ["enp4s0f1"];
      };
    };
    networking.interfaces.vmbr0.useDHCP = lib.mkDefault true;
    networking.interfaces.enp4s0f1.useDHCP = lib.mkDefault false;
  };
}

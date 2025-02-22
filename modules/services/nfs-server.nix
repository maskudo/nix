{ lib, config, ... }:
{
  options.services.nfs-server = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable NFS Server";
    };
  };
  config = lib.mkIf config.services.nfs-server.enable {
    boot.supportedFilesystems = [ "nfs" ];
    boot.initrd.kernelModules = [ "nfs" ];
    services.nfs.server = {
      enable = true;
      # fixed rpc.statd port; for firewall
      lockdPort = 4001;
      mountdPort = 4002;
      statdPort = 4000;
      extraNfsdConfig = '''';
    };

    networking.firewall = {
      # for NFSv3; view with `rpcinfo -p`
      allowedTCPPorts = [
        111
        2049
        4000
        4001
        4002
        20048
      ];
      allowedUDPPorts = [
        111
        2049
        4000
        4001
        4002
        20048
      ];
    };
  };
}

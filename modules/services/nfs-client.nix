{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.services.nfs-client = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable NFS Client";
    };
  };
  config = lib.mkIf config.services.nfs-client.enable {
    services.rpcbind.enable = true; # needed for NFS
    boot.initrd = {
      supportedFilesystems = [ "nfs" ];
      kernelModules = [ "nfs" ];
    };
    environment.systemPackages = with pkgs; [
      nfs-utils
    ];
  };
}

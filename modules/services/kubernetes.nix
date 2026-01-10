{
  lib,
  config,
  ...
}:
{
  options.services.homelab.k3s = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable k3s";
    };
  };
  config = lib.mkIf config.services.homelab.k3s.enable {
    networking.firewall.allowedTCPPorts = [ 6443 ];
    services.k3s = {
      enable = true;
      role = "server";
      tokenFile = "/var/lib/rancher/k3s/server/token";
      extraFlags = toString [
        "--write-kubeconfig-mode \"0644\""
        "--cluster-init"
        "--disable traefik"
      ];
    };
    # services.openiscsi = {
    #   enable = true;
    #   name = "iqn.2020-08.org.linux-iscsi.initiatorhost:${config.networking.hostname}";
    # };
  };
}

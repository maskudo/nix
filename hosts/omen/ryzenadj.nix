{ pkgs, ... }:
{
  systemd.services.ryzenadj = {
    description = "RyzenAdj power limits";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.ryzenadj}/bin/ryzenadj --stapm-limit=10000 --fast-limit=10000 --slow-limit=10000 --tctl-temp=75";
    };
  };

}

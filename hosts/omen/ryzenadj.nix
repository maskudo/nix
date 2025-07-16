{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ryzenadj
  ];
  systemd.services.ryzenadj = {
    description = "RyzenAdj power limits";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.ryzenadj}/bin/ryzenadj --stapm-limit=15000 --fast-limit=25000 --slow-limit=10000 --tctl-temp=75";
    };
  };

}

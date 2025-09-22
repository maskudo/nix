{
  config,
  pkgs,
  lib,
  ...
}:
{
  options = {
    ryzenadjModule.enable = lib.mkOption {
      description = "Enables ryzenadj";
      default = false;
      type = lib.types.bool;
    };
  };

  config = lib.mkIf config.ryzenadjModule.enable {
    environment.systemPackages = with pkgs; [
      ryzenadj
    ];
    systemd.services.ryzenadj = {
      description = "RyzenAdj power limits";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.ryzenadj}/bin/ryzenadj --stapm-limit=35000 --fast-limit=35000 --slow-limit=30000 --tctl-temp=75";
      };
    };

  };
}

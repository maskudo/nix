{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    services.qbittorrent.enable = lib.mkOption {
      description = "Enables qbittorrent";
      default = false;
      type = lib.types.bool;
    };
  };

  config = lib.mkIf config.services.qbittorrent.enable {
    systemd.user.services.qbittorrent = {

      Unit = {
        Description = "Qbittorrent Service";
        Wants = [ "network-online.target" ];
        After = [
          "network-online.target"
          "nss-lookup.target"
        ];
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.qbittorrent-nox}/bin/qbittorrent-nox";
        Restart = "on-failure";
        RestartSec = "5s";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}

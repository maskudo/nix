{
  pkgs,
  enableGuiApps,
  lib,
  ...
}:
{
  systemd.user.services.qbittorrent = lib.mkIf (!enableGuiApps) {
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
}

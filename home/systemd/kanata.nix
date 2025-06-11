{ pkgs, config, ... }:
{
  systemd.user.services.kanata = {
    Unit = {
      Description = "Kanata Keyboard Service";
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.kanata}/bin/kanata -c ${config.home.homeDirectory}/.config/kanata/config.kbd";
      Restart = "on-failure";
      RestartSec = "5s";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

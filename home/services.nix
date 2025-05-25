{
  username,
  pkgs,
  lib,
  config,
  enableGuiApps,
  ...
}:
{
  systemd.user.enable = true;

  home.packages = with pkgs; [
    authenticator
    copyq
    emacs
    kanata
  ];

  services.copyq.enable = true;

  services.syncthing = {
    enable = true;
  };

  systemd.user.services.commit-zt = {
    Unit = {
      Description = "Automatic Git Commit and Push";
    };
    Service = {
      ExecStart = "/home/${username}/zt/auto-commit.sh"; # Path to script
      WorkingDirectory = "/home/${username}/zt/"; # Set your working directory
      Type = "oneshot"; # The service runs and finishes once each time it's triggered
    };
  };

  systemd.user.timers.commit-zt = {
    Unit = {
      Description = "Make regular backups of zt to git.";
    };
    Timer = {
      OnCalendar = "*-*-* 11,21:00:00";
      Persistent = true; # so that the timer runs afterwards in case of system not being online
    };
    Install = {
      WantedBy = [ "timers.target" ]; # Ensures the timer is part of the timers target
    };
  };

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

{
  pkgs,
  lib,
  username,
  ...
}:
{
  systemd.user.services.commit-zt = lib.mkIf pkgs.stdenv.isLinux {
    Unit = {
      Description = "Automatic Git Commit and Push";
    };
    Service = {
      ExecStart = "/home/${username}/zt/auto-commit.sh"; # Path to script
      WorkingDirectory = "/home/${username}/zt/"; # Set your working directory
      Type = "oneshot"; # The service runs and finishes once each time it's triggered
      Environment = "PATH=/run/current-system/sw/bin:/home/${username}/.nix-profile/bin";
    };
  };

  systemd.user.timers.commit-zt = lib.mkIf pkgs.stdenv.isLinux {
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

  launchd.agents.commit-zt = lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;

    config = {
      Label = "commit-zt";

      ProgramArguments = [
        "/bin/sh"
        "/Users/${username}/zt/auto-commit.sh"
      ];

      WorkingDirectory = "/Users/${username}/zt";

      EnvironmentVariables = {
        PATH = "/run/current-system/sw/bin:/etc/profiles/per-user/${username}/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin";
      };
      StartCalendarInterval = [
        {
          Hour = 11;
          Minute = 0;
        }
        {
          Hour = 21;
          Minute = 0;
        }
      ];

      StandardOutPath = "/tmp/commit-zt.log";
      StandardErrorPath = "/tmp/commit-zt.err";
    };
  };
}

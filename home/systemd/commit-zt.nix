{ username, ... }:
{
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

}

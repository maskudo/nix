{ pkgs, ... }:
{
  systemd.user.services.sync-photos = {
    Unit = {
      Description = "Sync Photos";
    };
    Service = {
      ExecStart = ''${pkgs.rsync}/bin/rsync -Prvh /mnt/media/photos /mnt/game'';
      Type = "oneshot"; # The service runs and finishes once each time it's triggered
    };
  };

  systemd.user.timers.sync-photos = {
    Unit = {
      Description = "Make regular backups of photos";
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

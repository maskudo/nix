{
  pkgs,
  config,
  lib,
  ...
}:
{
  services.activitywatch = {
    enable = config.home.guiApps.enable;
    watchers = {
      aw-watcher-afk = {
        package = pkgs.awatcher;
        settings = {
          timeout = 300;
          poll_time = 2;
        };
      };

      aw-watcher-window = {
        package = pkgs.awatcher;
        settings = {
          poll_time = 1;
          exclude_title = true;
        };
      };
    };
  };
  home.packages =
    with pkgs;
    lib.mkIf config.home.guiApps.enable [
      awatcher
    ];
}

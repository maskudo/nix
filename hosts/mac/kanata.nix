# https://github.com/michaelbrusegard/nix-config/blob/a9111442c3779dd1fc320ac37b66e2d572ba23e8/modules/darwin/kanata.nix#L7
{
  pkgs,
  lib,
  username,
  ...
}:
{
  environment.systemPackages = [ pkgs.kanata ];
  launchd.daemons = {
    kanata = {
      command = "${lib.getExe pkgs.kanata} -c /Users/${username}/.config/kanata/darwin.kbd";
      serviceConfig = {
        RunAtLoad = true;
        KeepAlive = true;
        StandardErrorPath = "/Library/Logs/Kanata/kanata.err.log";
        StandardOutPath = "/Library/Logs/Kanata/kanata.out.log";
      };
    };
    karabiner-vhiddaemon = {
      serviceConfig = {
        ProgramArguments = [
          "/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon"
        ];
        RunAtLoad = true;
        KeepAlive = true;
      };
    };
    karabiner-vhidmanager = {
      serviceConfig = {
        ProgramArguments = [
          "/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager"
          "activate"
        ];
        RunAtLoad = true;
      };
    };
  };
}

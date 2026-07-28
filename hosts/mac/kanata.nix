# https://github.com/michaelbrusegard/nix-config/blob/a9111442c3779dd1fc320ac37b66e2d572ba23e8/modules/darwin/kanata.nix#L7
# stable-path pattern from https://github.com/michaelbrusegard/infra/blob/590739acaaa8b3183d988958ee934a6704d2b559/modules/darwin/kanata.nix
# kanata is copied into /Applications/Kanata.app on every rebuild so macOS
# Input Monitoring + Accessibility grants survive nix-store hash bumps.
{
  pkgs,
  lib,
  username,
  ...
}:
let
  kanataApp = "/Applications/Kanata.app";
  stableKanata = "${kanataApp}/Contents/MacOS/kanata";
  kanataConfig = "/Users/${username}/.config/kanata/darwin.kbd";

  keyboardWatcher = pkgs.writeShellScript "kanata-keyboard-watcher" ''
    state=/var/run/org.nixos.kanata.keyboards
    last_kick=/var/run/org.nixos.kanata.last_kick
    err_log=/Library/Logs/Kanata/kanata.err.log

    kanata_pid() {
      /bin/launchctl print system/org.nixos.kanata 2>/dev/null \
        | /usr/bin/grep -m1 '[[:space:]]pid = ' | /usr/bin/awk '{print $3}'
    }

    # Kickstart with a rate limit so the handoff errors kanata prints on
    # restart don't retrigger the watchdog into a loop.
    kickstart() {
      reason="$1"
      now=$(/bin/date +%s)
      last=$(/bin/cat "$last_kick" 2>/dev/null || echo 0)
      if [ $((now - last)) -lt 20 ]; then
        return 1
      fi
      echo "$(date '+%F %T') $reason, restarting kanata"
      /bin/launchctl kickstart -k system/org.nixos.kanata
      echo "$now" > "$last_kick"
      return 0
    }

    # Hot-plug / pid-change detection.
    current=$(/usr/bin/hidutil list --matching '{"DeviceUsagePage":1,"DeviceUsage":6}' \
      | /usr/bin/grep '^0x' \
      | /usr/bin/grep -v 'Apple Internal Keyboard' \
      | /usr/bin/grep -v 'Karabiner' \
      | /usr/bin/awk '{print $1, $2, $3}' | /usr/bin/sort -u || true)
    hash=$(printf '%s' "$current" | /sbin/md5 -q)
    new="$hash $(kanata_pid)"
    old=$(/bin/cat "$state" 2>/dev/null || true)
    if [ "$new" != "$old" ]; then
      if kickstart "keyboard set or kanata pid changed"; then
        pid=""
        for _ in 1 2 3 4 5 6 7 8 9 10; do
          sleep 1
          pid=$(kanata_pid)
          [ -n "$pid" ] && break
        done
        printf '%s %s' "$hash" "$pid" > "$state"
      fi
    fi

    # Watchdog: kanata alive but its HID handles are dead (typical after
    # sleep/wake, sometimes random). Detect by tailing recent err log.
    if [ -f "$err_log" ]; then
      log_mtime=$(/usr/bin/stat -f %m "$err_log" 2>/dev/null || echo 0)
      now=$(/bin/date +%s)
      if [ $((now - log_mtime)) -lt 10 ]; then
        if /usr/bin/tail -n 5 "$err_log" 2>/dev/null \
            | /usr/bin/grep -qE 'IOHIDDeviceOpen error|not permitted|exclusive access'; then
          kickstart "kanata err log shows recent IOHID errors"
        fi
      fi
    fi
  '';
in
{
  environment.systemPackages = [ pkgs.kanata ];

  system.activationScripts.postActivation.text = ''
    install -d -m 755 ${lib.escapeShellArg "${kanataApp}/Contents/MacOS"}
    install -d -m 755 ${lib.escapeShellArg "${kanataApp}/Contents/Resources"}
    install -m 755 ${pkgs.kanata}/bin/kanata ${stableKanata}
    cat > ${lib.escapeShellArg "${kanataApp}/Contents/Info.plist"} <<'EOF'
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>CFBundleExecutable</key>
      <string>kanata</string>
      <key>CFBundleIdentifier</key>
      <string>org.nixos.kanata</string>
      <key>CFBundleName</key>
      <string>Kanata</string>
      <key>CFBundlePackageType</key>
      <string>APPL</string>
    </dict>
    </plist>
    EOF
    /usr/bin/codesign --force --deep --sign - ${lib.escapeShellArg kanataApp} >/dev/null
  '';

  launchd.daemons = {
    kanata = {
      serviceConfig = {
        ProgramArguments = [
          stableKanata
          "--no-wait"
          "-c"
          kanataConfig
        ];
        RunAtLoad = true;
        KeepAlive = true;
        StandardErrorPath = "/Library/Logs/Kanata/kanata.err.log";
        StandardOutPath = "/Library/Logs/Kanata/kanata.out.log";
      };
    };
    kanata-keyboard-watcher = {
      serviceConfig = {
        ProgramArguments = [ "${keyboardWatcher}" ];
        RunAtLoad = true;
        StartInterval = 5;
        StandardErrorPath = "/Library/Logs/Kanata/keyboard-watcher.err.log";
        StandardOutPath = "/Library/Logs/Kanata/keyboard-watcher.out.log";
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

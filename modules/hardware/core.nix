{ pkgs, ... }:
{
  services = {
    system76-scheduler.enable = true;
    dbus.packages = [ pkgs.dconf ];
    logind = {
      settings.Login = {
        HandlePowerKey = "ignore";
        HandleLidSwitch = "ignore";
      };
    };
    locate = {
      enable = true;
      package = pkgs.plocate;
    };

    openssh.enable = true;

    # automount usb drives
    udev.extraRules = ''
      ACTION=="add", SUBSYSTEMS=="usb", SUBSYSTEM=="block", ENV{ID_FS_USAGE}=="filesystem", RUN{program}+="${pkgs.systemd}/bin/systemd-mount --no-block --automount=yes --collect $devnode /media"
    '';
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tumbler.enable = true; # Thumbnail support for images

    printing.enable = false;

    blueman.enable = true;

  };

  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    enableAllFirmware = true;
  };

  zramSwap.enable = true;
}

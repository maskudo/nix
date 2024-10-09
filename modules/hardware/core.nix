{pkgs, ...}: {
  services = {
    dbus.packages = [pkgs.dconf];
    logind = {
      lidSwitch = "ignore";
      extraConfig = ''
        HandlePowerKey=ignore
      '';
    };

    locate = {
      enable = true;
      package = pkgs.plocate;
      localuser = null;
    };

    openssh.enable = true;

    # automount usb drives
    udev.extraRules = ''
      ACTION=="add", SUBSYSTEMS=="usb", SUBSYSTEM=="block", ENV{ID_FS_USAGE}=="filesystem", RUN{program}+="${pkgs.systemd}/bin/systemd-mount --no-block --automount=yes --collect $devnode /media"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="0408", ATTRS{idProduct}=="a030", ATTR{authorized}="0"
    '';
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tumbler.enable = true; # Thumbnail support for images

    printing.enable = true;

    blueman.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = {
            main = {
              "monitor.libcamera" = "disabled";
            };
          };
        };
      };
    };
  };

  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    enableAllFirmware = true;
  };
}

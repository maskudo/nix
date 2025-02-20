{ pkgs, lib, ... }:
{
  # Bootloader.
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "uinput" ];
    initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usb_storage"
      "sd_mod"
      "rtsx_pci_sdmmc"
      "uvcvideo"
    ];
    blacklistedKernelModules = [ "nouveau" ];
    loader.grub = {
      enable = true;
      copyKernels = true;
      efiInstallAsRemovable = true;
      efiSupport = true;
      useOSProber = true;
      fsIdentifier = "uuid";
      devices = [ "nodev" ];
    };
    loader.grub2-theme = {
      theme = "vimix";
      splashImage = lib.mkForce ../../wallpapers/flowering-rain.png;
      footer = true;
    };
    # usbcore.quirks for keyboard
    kernelParams = [ "usbcore.quirks=5566:0008:gki" ];
    supportedFilesystems = [ "ntfs" ];
    loader.grub.extraEntries = ''
      menuentry "Reboot" {
        reboot
      }
      menuentry "Poweroff" {
        halt
      }
    '';
  };
}

{stablePkgs, ...}: {
  # Bootloader.
  boot = {
    kernelPackages = stablePkgs.linuxPackages;
    kernelModules = ["kvm-intel"];
    blacklistedKernelModules = ["nouveau"];
    loader.grub = {
      enable = true;
      copyKernels = true;
      splashImage = ../../wallpapers/nix-wallpaper-stripes-logo.png;
      efiInstallAsRemovable = true;
      efiSupport = true;
      useOSProber = true;
      fsIdentifier = "uuid";
      devices = ["nodev"];
    };
    kernelParams = ["button.lid_init_state=open"];
    supportedFilesystems = ["ntfs"];
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

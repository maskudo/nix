{
  config,
  pkgs,
  lib,
  ...
}:
{
  boot.kernelModules = [
    "nvidia"
    "nvidia-uvm"
  ];
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [
    "nvidia"
    "amdgpu"
  ];
  services.xserver.config = ''
    Section "ServerLayout"
             Identifier "layout"
             Screen 0 "amdgpu"
             Inactive "nvidia"
             Option "AllowNVIDIAGPUScreens"
     EndSection

     Section "Device"
         Identifier "amdgpu"
         Driver "amdgpu"
         Option "TearFree" "true"
         Option "DRI" "3"
         Option "VariableRefresh" "true"
         BusID "PCI:6:0:0"
     EndSection

     Section "Screen"
         Identifier "amdgpu"
         Device "amdgpu"
     EndSection

     Section "Device"
         Identifier "nvidia"
         Driver "nvidia"
         BusID "PCI:1:0:0"
     EndSection

     Section "Screen"
             Identifier "nvidia"
             Device "nvidia"
     EndSection
  '';
  nixpkgs.config.nvidia.acceptLicense = true;

  environment.systemPackages = with pkgs; [
    eglexternalplatform
    egl-wayland
  ];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    prime = {
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
  specialisation = {
    nvidia-sync.configuration = {
      environment.etc."specialisation".text = "nvidia";
      hardware.nvidia = {
        prime = {
          offload = {
            enable = lib.mkForce false;
            enableOffloadCmd = lib.mkForce false;
          };
          sync.enable = true;
        };
      };
    };
  };
}

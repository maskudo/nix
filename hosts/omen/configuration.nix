{
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/programs
    ../../modules/services
    ../../modules/desktop
    ../../modules/hardware
  ];

  desktop.hyprland.enable = true;

  services.xserver.videoDrivers = [
    "nvidia"
    "amdgpu"
  ];

  system.stateVersion = "23.05";
}

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

  services.xserver.videoDrivers = [
    "nvidia"
    "amdgpu"
  ];

  system.stateVersion = "23.05";
}

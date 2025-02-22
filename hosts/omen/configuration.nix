{
  pkgs,
  username,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/programs
    ../../modules/services
    ../../modules/desktop/i3.nix
    ../../modules/hardware
  ];

  services.xserver.videoDrivers = [
    "nvidia"
    "amdgpu"
  ];

  system.stateVersion = "23.05";
}

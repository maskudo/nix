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

  system.stateVersion = "23.05";
}

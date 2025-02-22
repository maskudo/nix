{
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

  system.stateVersion = "23.05";
}

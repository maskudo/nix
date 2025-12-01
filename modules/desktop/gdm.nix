{
  lib,
  config,
  enableGuiApps,
  ...
}:
{
  services.displayManager = lib.mkIf (config.services.xserver.enable || enableGuiApps) {
    gdm.enable = true;
  };
  security.pam.services.gdm.enableGnomeKeyring = true;
}

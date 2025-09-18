{ lib, config, ... }:
{
  environment.sessionVariables.GTK_CSD = "0"; # disable client side window decorations
  services.libinput =
    lib.mkIf (config.desktop.i3.enable || config.desktop.hyprland.enable || config.desktop.sway.enable)
      {
        enable = true;
        touchpad = {
          tapping = true;
          naturalScrolling = true;
          middleEmulation = false;
          disableWhileTyping = true;
        };
        mouse = {
          naturalScrolling = false;
          middleEmulation = false;
        };
      };
}

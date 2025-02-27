{ lib, config, ... }:
{
  services.libinput = lib.mkIf (config.desktop.i3.enable || config.desktop.hyprland.enable) {
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

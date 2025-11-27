{
  lib,
  config,
  pkgs,
  unstablePkgs,
  ...
}:
{
  environment.sessionVariables.GTK_CSD = "0"; # disable client side window decorations
  services.libinput =
    lib.mkIf (config.services.xserver.enable || config.services.displayManager.sddm.wayland.enable)
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

  environment.systemPackages =
    with pkgs;
    lib.mkIf (config.services.displayManager.sddm.wayland.enable) [
      bemoji
      cliphist
      dunst
      foot
      hyprlock
      hyprshot
      hyprpicker
      kanshi
      rofi-wayland
      swappy
      swww
      unstablePkgs.wlr-which-key
      unstablePkgs.hyprmagnifier
      waybar
      wl-clipboard
      wl-clipboard-x11
      wl-mirror
      wlr-randr
      xwayland-satellite
    ];
}
